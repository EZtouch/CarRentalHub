using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using EZtouch.CarRentalHub.ApplicationCore.Entities;
using EZtouch.CarRentalHub.Infrastructure.Data;

namespace EZtouch.CarRentalHub.Controllers.API
{
    [Produces("application/json")]
    [Route("api/Colors")]
    public class ColorsController : Controller
    {
        private readonly RentalDBContext _context;

        public ColorsController(RentalDBContext context)
        {
            _context = context;
        }

        // GET: api/Colors
        [HttpGet]
        public IEnumerable<Color> GetColors()
        {
            return _context.Colors;
        }

        // GET: api/Colors/5
        [HttpGet("{id}")]
        public async Task<IActionResult> GetColor([FromRoute] short id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var color = await _context.Colors.SingleOrDefaultAsync(m => m.ColorId == id);

            if (color == null)
            {
                return NotFound();
            }

            return Ok(color);
        }

        // PUT: api/Colors/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutColor([FromRoute] short id, [FromBody] Color color)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != color.ColorId)
            {
                return BadRequest();
            }

            _context.Entry(color).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ColorExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Colors
        [HttpPost]
        public async Task<IActionResult> PostColor([FromBody] Color color)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            _context.Colors.Add(color);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetColor", new { id = color.ColorId }, color);
        }

        // DELETE: api/Colors/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteColor([FromRoute] short id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var color = await _context.Colors.SingleOrDefaultAsync(m => m.ColorId == id);
            if (color == null)
            {
                return NotFound();
            }

            _context.Colors.Remove(color);
            await _context.SaveChangesAsync();

            return Ok(color);
        }

        private bool ColorExists(short id)
        {
            return _context.Colors.Any(e => e.ColorId == id);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using EZtouch.CarRentalHub.Models;

namespace Web.Controllers
{
    public class CarsController : Controller
    {
        private readonly RentalDBContext _context;

        public CarsController(RentalDBContext context)
        {
            _context = context;
        }

        // GET: Cars
        public async Task<IActionResult> Index()
        {
            var rentalDBContext = _context.Car.Include(c => c.Availability).Include(c => c.Class).Include(c => c.Color).Include(c => c.Model);
            return View(await rentalDBContext.ToListAsync());
        }

        // GET: Cars/Details/5
        public async Task<IActionResult> Details(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var car = await _context.Car
                .Include(c => c.Availability)
                .Include(c => c.Class)
                .Include(c => c.Color)
                .Include(c => c.Model)
                .SingleOrDefaultAsync(m => m.CarId == id);
            if (car == null)
            {
                return NotFound();
            }

            return View(car);
        }

        // GET: Cars/Create
        public IActionResult Create()
        {
            ViewData["AvailabilityId"] = new SelectList(_context.Availability, "AvailabilityId", "Description");
            ViewData["ClassId"] = new SelectList(_context.Class, "ClassId", "ClassId");
            ViewData["ColorId"] = new SelectList(_context.Color, "ColorId", "Code");
            ViewData["ModelId"] = new SelectList(_context.Model, "ModelId", "Name");
            return View();
        }

        // POST: Cars/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("CarId,AvailabilityId,ModelId,ColorId,ClassId,Mileage,RegPlateNo,YearManufactured,ImgPath")] Car car)
        {
            if (ModelState.IsValid)
            {
                car.CarId = Guid.NewGuid();
                _context.Add(car);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["AvailabilityId"] = new SelectList(_context.Availability, "AvailabilityId", "Description", car.AvailabilityId);
            ViewData["ClassId"] = new SelectList(_context.Class, "ClassId", "ClassId", car.ClassId);
            ViewData["ColorId"] = new SelectList(_context.Color, "ColorId", "Code", car.ColorId);
            ViewData["ModelId"] = new SelectList(_context.Model, "ModelId", "Name", car.ModelId);
            return View(car);
        }

        // GET: Cars/Edit/5
        public async Task<IActionResult> Edit(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var car = await _context.Car.SingleOrDefaultAsync(m => m.CarId == id);
            if (car == null)
            {
                return NotFound();
            }
            ViewData["AvailabilityId"] = new SelectList(_context.Availability, "AvailabilityId", "Description", car.AvailabilityId);
            ViewData["ClassId"] = new SelectList(_context.Class, "ClassId", "ClassId", car.ClassId);
            ViewData["ColorId"] = new SelectList(_context.Color, "ColorId", "Code", car.ColorId);
            ViewData["ModelId"] = new SelectList(_context.Model, "ModelId", "Name", car.ModelId);
            return View(car);
        }

        // POST: Cars/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Guid id, [Bind("CarId,AvailabilityId,ModelId,ColorId,ClassId,Mileage,RegPlateNo,YearManufactured,ImgPath")] Car car)
        {
            if (id != car.CarId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(car);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CarExists(car.CarId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["AvailabilityId"] = new SelectList(_context.Availability, "AvailabilityId", "Description", car.AvailabilityId);
            ViewData["ClassId"] = new SelectList(_context.Class, "ClassId", "ClassId", car.ClassId);
            ViewData["ColorId"] = new SelectList(_context.Color, "ColorId", "Code", car.ColorId);
            ViewData["ModelId"] = new SelectList(_context.Model, "ModelId", "Name", car.ModelId);
            return View(car);
        }

        // GET: Cars/Delete/5
        public async Task<IActionResult> Delete(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var car = await _context.Car
                .Include(c => c.Availability)
                .Include(c => c.Class)
                .Include(c => c.Color)
                .Include(c => c.Model)
                .SingleOrDefaultAsync(m => m.CarId == id);
            if (car == null)
            {
                return NotFound();
            }

            return View(car);
        }

        // POST: Cars/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(Guid id)
        {
            var car = await _context.Car.SingleOrDefaultAsync(m => m.CarId == id);
            _context.Car.Remove(car);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CarExists(Guid id)
        {
            return _context.Car.Any(e => e.CarId == id);
        }
    }
}

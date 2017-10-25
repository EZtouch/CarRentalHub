using System;
using System.ComponentModel.DataAnnotations;
using EZtouch.CarRentalHub.ApplicationCore.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace EZtouch.CarRentalHub.Infrastructure.Data
{
    public partial class RentalDBContext : DbContext
    {
        public virtual DbSet<Availability> Availabilities { get; set; }
        public virtual DbSet<Car> Cars { get; set; }
        public virtual DbSet<Class> Classes { get; set; }
        public virtual DbSet<Color> Colors { get; set; }
        public virtual DbSet<Make> Makes { get; set; }
        public virtual DbSet<ApplicationCore.Entities.Model> Models { get; set; }
        public virtual DbSet<Rental> Rentals { get; set; }
        public virtual DbSet<Transmission> Transmissions { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<UserRole> UserRoles { get; set; }

        public RentalDBContext(DbContextOptions<RentalDBContext> options)
            : base(options)
        { }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Map the table name with the entity model display name instead of dbset
            foreach (var entity in modelBuilder.Model.GetEntityTypes())
            {
                entity.Relational().TableName = entity.DisplayName();
            }

            modelBuilder.Entity<Availability>(entity =>
            {
                entity.HasIndex(e => e.AvailabilityId)
                    .HasName("UQ_Availability_AvailabilityId")
                    .IsUnique();

                entity.HasIndex(e => e.Description)
                    .HasName("UQ_Availability_Description")
                    .IsUnique();

                entity.Property(e => e.AvailabilityId)
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasMaxLength(20);
            });

            modelBuilder.Entity<Car>(entity =>
            {
                entity.HasIndex(e => e.CarId)
                    .HasName("UQ_Car_CarId")
                    .IsUnique();

                entity.HasIndex(e => e.RegPlateNo)
                    .HasName("UQ_Car_RegPlateNo")
                    .IsUnique();

                entity.Property(e => e.RegPlateNo)
                    .IsRequired()
                    .HasMaxLength(12);

                entity.Property(e => e.YearManufactured)
                    .HasColumnType("date");

                entity.HasOne(d => d.Availability)
                    .WithMany(p => p.Car)
                    .HasForeignKey(d => d.AvailabilityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Car_Availability");

                entity.HasOne(d => d.Color)
                    .WithMany(p => p.Car)
                    .HasForeignKey(d => d.ColorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Car_Color");

                entity.HasOne(d => d.Model)
                    .WithMany(p => p.Car)
                    .HasForeignKey(d => d.ModelId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Car_Model");
            });

            modelBuilder.Entity<Class>(entity =>
            {
                entity.HasIndex(e => e.ClassId)
                    .HasName("UQ_Class_ClassId")
                    .IsUnique();

                entity.HasIndex(e => e.Name)
                    .HasName("UQ_Class_Name")
                    .IsUnique();

                entity.Property(e => e.ClassId)
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Description)
                    .HasMaxLength(255);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Color>(entity =>
            {
                entity.HasIndex(e => e.Code)
                    .HasName("UQ_Color_Code")
                    .IsUnique();

                entity.HasIndex(e => e.ColorId)
                    .HasName("UQ_Color_ColorId")
                    .IsUnique();

                entity.HasIndex(e => e.Name)
                    .HasName("UQ_Color_Name")
                    .IsUnique();

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasColumnType("char(7)");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Make>(entity =>
            {
                entity.HasIndex(e => e.MakeId)
                    .HasName("UQ_Make_MakeId")
                    .IsUnique();

                entity.HasIndex(e => e.Name)
                    .HasName("UQ_Make_Name")
                    .IsUnique();

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<ApplicationCore.Entities.Model>(entity =>
            {
                entity.HasIndex(e => e.ModelId)
                    .HasName("UQ_Model_ModelId")
                    .IsUnique();

                entity.HasIndex(e => e.Name)
                    .HasName("UQ_Model_Name")
                    .IsUnique();

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.Class)
                    .WithMany(p => p.Model)
                    .HasForeignKey(d => d.ClassId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Model_Class");

                entity.HasOne(d => d.Make)
                    .WithMany(p => p.Model)
                    .HasForeignKey(d => d.MakeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Model_Make");

                entity.HasOne(d => d.Transmission)
                    .WithMany(p => p.Model)
                    .HasForeignKey(d => d.TransmissionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Model_Transmission");
            });

            modelBuilder.Entity<Rental>(entity =>
            {
                entity.HasIndex(e => e.RentalId)
                    .HasName("UQ_Rental_RentalId")
                    .IsUnique();

                entity.Property(e => e.ExpectedReturnDate)
                    .HasColumnType("datetime");

                entity.Property(e => e.RentDate)
                    .HasColumnType("datetime");

                entity.Property(e => e.ReturnDate)
                    .HasColumnType("datetime");

                entity.HasOne(d => d.Car)
                    .WithMany(p => p.Rental)
                    .HasForeignKey(d => d.CarId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Rental_Car");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.RentalEmployee)
                    .HasForeignKey(d => d.EmployeeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Rental_Employee");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.RentalUser)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Rental_User");
            });

            modelBuilder.Entity<Transmission>(entity =>
            {
                entity.HasIndex(e => e.TransmissionId)
                    .HasName("UQ_Transmission_TransmissionId")
                    .IsUnique();

                entity.HasIndex(e => e.Type)
                    .HasName("UQ_Transmission_Type")
                    .IsUnique();

                entity.Property(e => e.TransmissionId)
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Description)
                    .HasMaxLength(255);

                entity.Property(e => e.Type)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.HasIndex(e => e.Dob)
                    .HasName("UQ_User_Email")
                    .IsUnique();

                entity.HasIndex(e => e.Phone)
                    .HasName("UQ_User_Phone")
                    .IsUnique();

                entity.HasIndex(e => e.UserId)
                    .HasName("UQ_User_UserId")
                    .IsUnique();

                entity.Property(e => e.Dob)
                    .HasColumnName("DOB")
                    .HasColumnType("date");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(75)
                    .HasAnnotation("DataType", DataType.EmailAddress);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(70);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(24)
                    .HasAnnotation("DataType", DataType.Password);

                entity.Property(e => e.Phone)
                    .IsRequired()
                    .HasMaxLength(30);

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.User)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_User_UserRole");
            });

            modelBuilder.Entity<UserRole>(entity =>
            {
                entity.HasKey(e => e.RoleId);

                entity.HasIndex(e => e.Name)
                    .HasName("UQ_UserRole_Name")
                    .IsUnique();

                entity.HasIndex(e => e.RoleId)
                    .HasName("UQ_UserRole_RoleId")
                    .IsUnique();

                entity.Property(e => e.RoleId)
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Description)
                    .HasMaxLength(255);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(15);
            });
        }
    }
}

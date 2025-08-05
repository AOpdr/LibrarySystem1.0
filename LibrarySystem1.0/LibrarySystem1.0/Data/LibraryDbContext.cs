using LibrarySystem1._0.Models;
using Microsoft.EntityFrameworkCore;

namespace LibrarySystem1._0.Data;

public class LibraryDbContext : DbContext
{
    public LibraryDbContext(DbContextOptions<LibraryDbContext> options) : base(options)
    {
    }

    // このDbContextが、Booksテーブルを扱うことを宣言する
    public DbSet<Book> Books { get; set; }
}

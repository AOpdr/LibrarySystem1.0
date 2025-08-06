using LibrarySystem1._0.Models;
using Microsoft.EntityFrameworkCore;

namespace LibrarySystem1._0.Data;

public class LibraryDbContext : DbContext
{
    public LibraryDbContext(DbContextOptions<LibraryDbContext> options) : base(options)
    {
    }

    // このDbContextが、Booksテーブルを扱うことを宣言する
    public DbSet<BookInfo> BookInfos { get; set; }
    //public DbSet<BookCopy> BookCopies { get; set; }
    //public DbSet<User> Users { get; set; }
    //public DbSet<LendingRecord> LendingRecords { get; set; }
}

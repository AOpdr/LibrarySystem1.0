using Microsoft.AspNetCore.Mvc;
using LibrarySystem1._0.Models; // ←先ほど作ったModels/Book.csの情報を使う
using Microsoft.EntityFrameworkCore;
using LibrarySystem1._0.Data; // Entity Framework Coreの非同期処理機能を使うために追加

namespace LibrarySystem1._0.Controllers
{
    public class BooksController : Controller
    {
        // 1. DBとの橋渡し役であるDbContextをクラス内で使うための変数を準備
        private readonly LibraryDbContext _context;

        // 2. Controllerが呼び出される時、自動でDbContextが渡される
        public BooksController(LibraryDbContext context)
        {
            // 渡されたDbContextを、1.の変数に保存する
            _context = context;
        }

        // 3. 書籍テーブルの情報を渡すIndexメソッド
        public async Task<IActionResult> Index()
        {
            // 保管しておいた_contextを使って、Booksテーブルのデータを全て非同期で取得する
            var books = await _context.Books.ToListAsync();

            // 取得したDBの書籍リストをビューに渡す
            return View(books);
        }
    }
}

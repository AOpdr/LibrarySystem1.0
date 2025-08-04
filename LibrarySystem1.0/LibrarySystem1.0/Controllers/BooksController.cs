using Microsoft.AspNetCore.Mvc;
using LibrarySystem1._0.Models; // ←先ほど作ったModels/Book.csの情報を使う

namespace LibrarySystem1._0.Controllers
{
    public class BooksController : Controller
    {
        public IActionResult Index()
        {
            // DBに繋げる前にデータを表示させるため、適当なデータを作っておく
            var books = new List<Book>
            {
                new Book { BookId = 1, Title = "Peter's book", Author = "Aoki Pedro" },
                new Book { BookId = 2, Title = "今夜もカップラーメン", Author = "青木ぺど郎" },
                new Book { BookId = 2, Title = "明日天気になあれ", Author = "やすお" }
            };

            // Viewに上で作ったbooksのデータ（書籍リスト）を渡す
            return View(books);
        }
    }
}

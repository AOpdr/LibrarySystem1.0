-- ステップ1: 新しいテーブルを「dbo.BookInfo」として作成する
CREATE TABLE dbo.BookInfo (
    BookInfoId  INT IDENTITY(1,1) PRIMARY KEY,
    Title       NVARCHAR(100) NOT NULL,
    Author      NVARCHAR(50) NULL,
    Publisher   NVARCHAR(50) NULL,
    Isbn        VARCHAR(13) UNIQUE,
    Ndc         VARCHAR(10) NULL
);
GO

-- ステップ2: 既存の「dbo.Books」テーブルから新しい「dbo.BookInfo」へデータを移行する
SET IDENTITY_INSERT dbo.BookInfo ON;

INSERT INTO dbo.BookInfo (BookInfoId, Title, Author, Publisher, Isbn)
SELECT
    BookId,
    Title,
    Author,
    Publisher,
    Isbn
FROM
    dbo.Books;

SET IDENTITY_INSERT dbo.BookInfo OFF;
GO

-- これで作業は完了です。
-- 古いdbo.Booksはバックアップとして残り、新しいdbo.BookInfoにデータが移行されました。
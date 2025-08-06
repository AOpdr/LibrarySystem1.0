-- もし古い 'Books' テーブルが存在していたら、削除する
-- IF OBJECT_ID('dbo.Books', 'U') IS NOT NULL
--   DROP TABLE dbo.Books;
-- GO

-- もし既存のテーブルがあれば削除（まっさらな状態から作り直すため）
-- IF OBJECT_ID('dbo.LendingRecords', 'U') IS NOT NULL
--   DROP TABLE dbo.LendingRecords;
-- IF OBJECT_ID('dbo.BookCopies', 'U') IS NOT NULL
--   DROP TABLE dbo.BookCopies;
-- IF OBJECT_ID('dbo.BookInfo', 'U') IS NOT NULL
--   DROP TABLE dbo.BookInfo;
-- IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL
--   DROP TABLE dbo.Users;
-- GO

--------------------------------------------------
-- 1. 利用者テーブル
--------------------------------------------------
CREATE TABLE dbo.Users (
    UserId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
    Remarks NVARCHAR(MAX) NULL
);
GO

--------------------------------------------------
-- 2. 書誌情報テーブル (本の種類) 作成済みのためコメントアウト
--------------------------------------------------
-- CREATE TABLE dbo.BookInfo (
--     BookInfoId INT PRIMARY KEY IDENTITY(1,1),
--     Title NVARCHAR(100) NOT NULL,
--     Author NVARCHAR(50),
--     Publisher NVARCHAR(50),
--     Isbn VARCHAR(13) UNIQUE,
--     Ndc VARCHAR(10) NULL -- (オプション) 日本十進分類法
-- );
-- GO

--------------------------------------------------
-- 3. 蔵書テーブル (物理的な本)
--------------------------------------------------
CREATE TABLE dbo.BookCopies (
    CopyId INT PRIMARY KEY IDENTITY(1,1),
    BookInfoId INT NOT NULL FOREIGN KEY REFERENCES dbo.BookInfo(BookInfoId),
    Location NVARCHAR(50) NOT NULL, -- 所蔵館
    Status INT NOT NULL DEFAULT 0, -- 0:貸出可能, 1:貸出中, 2:修理中 など
    RegisteredDate DATETIME2 NOT NULL DEFAULT GETDATE()
);
GO

--------------------------------------------------
-- 4. 貸出記録テーブル
--------------------------------------------------
CREATE TABLE dbo.LendingRecords (
    LendingId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT NOT NULL FOREIGN KEY REFERENCES dbo.Users(UserId),
    CopyId INT NOT NULL FOREIGN KEY REFERENCES dbo.BookCopies(CopyId),
    LentDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE NULL -- 返却されるまではNULL
);
GO
class Api::V1::BooksController < ApplicationController
  
  def index
    @books = Book.all
    render json: @books
  end

  def show
    @book = Book.find(params[:id])
    render json: @book
  end

  def new
    @book = Book.new
    render json: @book
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created
    else
      render json: @book.errors.full_messages, status: :unprocessable_entity
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      render json: @book, status: :ok
    else
      render json: @book.errors.full_messages, status: :unprocessable_entity
    end
  end

  
end

private

def book_params
  params.require(:book).permit(:title, :author, :photo)
end
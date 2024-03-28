class Api::V1::BooksController < ApplicationController
  before_action :set_books, only: [:show, :edit, :update, :destroy]
  
  def index
    @books = Book.all
    render json: @books
  end

  def show
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
    render json: @book
  end

  def update
    if @book.update(book_params)
      render json: @book, status: :ok
    else
      render json: @book.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    if @book.destroy
      render json: {
        status: {
          code: 200,
          message: 'Book deleted successfully'
        }
      }, status: :ok
    else
      render json: {
        status: {
          code: 400,
          message: 'Book could not be deleted'
        }
      }, status: :unproccessable_entity
    end
  end


end

private

def book_params
  params.require(:book).permit(:title, :author, :photo)
end

def set_books
  @book = Book.find(params[:id])
end
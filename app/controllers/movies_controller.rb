class MoviesController < ApplicationController
  def index

    # filter of the search:
    if params[:query].present?
      # 1.first option only works for superman
      # @movies = Movie.where(title: params[:query])

      # 2.second option case insensitive
       # @movies = Movie.where("title ILIKE ?", "%#{params[:query]}%")

      # 3. third option: we look in different columns of the same table: i want superman included either in the title or syllabus and case insensitive
      # sql_query = "title ILIKE :query OR syllabus ILIKE :query"
      # @movies = Movie.where(sql_query, query: "%#{params[:query]}%")

      # 4. looking for differents columns of different tables that are associated(case insentive, contains)
      # sql_query = " \
      #   movies.title ILIKE :query \
      #   OR movies.syllabus ILIKE :query \
      #   OR directors.first_name ILIKE :query \
      #   OR directors.last_name ILIKE :query \
      # "
      # @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")

      # 5. when as a user i m just giving the beggining of a word and its finding it => full text search is basically able to take many words to be able to look for a full text
      sql_query = " \
        movies.title @@ :query \
        OR movies.syllabus @@ :query \
        OR directors.first_name @@ :query \
        OR directors.last_name @@ :query \
      "
      @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")
    else
      @movies = Movie.all
    end
  end
end

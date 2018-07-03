class Api::V1::JournalsController < ActionController::API
  def index
    @journals = Journal.all
    render json: @journals.to_json
  end

  def show
    @journal = Journal.find_by(id: params[:id])
    render json: @journal.to_json
  end

  def create
    @journal = Journal.create(journal_params)
    render json: @journal.to_json
  end

  def destroy
    Journal.find_by(id: params[:id]).destroy
    render json: Journal.all
  end

  def update
    @journal = Journal.find_by(id: params[:id])
    @journal.title = journal_params[:title]
    @journal.content = journal_params[:content]
    @journal.save
    render json: @journal.to_json
  end

  private

  def journal_params
    params.require(:journal).permit(:user_id, :title, :content, :id)
  end

end

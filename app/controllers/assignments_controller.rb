class AssignmentsController < ApplicationController
  # GET /assignments
  # GET /assignments.json
  def index
    @assignments = Assignment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assignments }
    end
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
    @assignment = Assignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @assignment }
    end
  end

  # GET /assignments/new
  # GET /assignments/new.json
  def new
    @assignment = Assignment.new
    @subject = Subject.find_by_id(params[:subject_id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @assignment }
    end
  end

  # GET /assignments/1/edit
  def edit
    @subject = Subject.find_by_id(params[:subject_id])
    @assignment = @subject.assignments.find(params[:id])
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @subject = Subject.find_by_id(params[:subject_id])
    @assignment = @subject.assignments.new(params[:assignment])

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to my_assignments_url(params[:subject_id]), notice: 'Assignment was successfully created.' }
        format.json { render json: @assignment, status: :created, location: @assignment }
      else
        format.html { render action: "new" }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /assignments/1
  # PUT /assignments/1.json
  def update
    @assignment = Assignment.find(params[:id])

    respond_to do |format|
      if @assignment.update_attributes(params[:assignment])
        format.html { redirect_to @assignment, notice: 'Assignment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @subject = Subject.find_by_id(params[:subject_id])
    @assignment = @subject.assignments.find(params[:id])
    @assignment.destroy

    respond_to do |format|
      format.html { redirect_to my_assignments_url(params[:subject_id]) }
      format.json { head :no_content }
    end
  end

  def by_subject
    @subject = Subject.find_by_id(params[:id])
    @assignments = @subject.assignments.all
    
    respond_to do |format|
      format.html # index.html.erb
      # format.json { render json: @assignments }
    end
  end
end

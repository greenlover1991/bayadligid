class AppliedLoanDetailsController < ApplicationController
  # GET /applied_loan_details
  # GET /applied_loan_details.json
  def index
    @applied_loan_details = AppliedLoanDetail.find_all_by_applied_loan_id(params[:applied_loan_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @applied_loan_details }
    end
  end

  # GET /applied_loan_details/1
  # GET /applied_loan_details/1.json
  def show
    @applied_loan_detail = AppliedLoanDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @applied_loan_detail }
    end
  end

  # GET /applied_loan_details/new
  # GET /applied_loan_details/new.json
  def new
    @applied_loan_detail = AppliedLoanDetail.new(:applied_loan_id=>params[:applied_loan_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @applied_loan_detail }
    end
  end

  # GET /applied_loan_details/1/edit
  def edit
    @applied_loan_detail = AppliedLoanDetail.find(params[:id])
  end

  # POST /applied_loan_details
  # POST /applied_loan_details.json
  def create
    @applied_loan_detail = AppliedLoanDetail.new(params[:applied_loan_detail])

    respond_to do |format|
      if @applied_loan_detail.save
        format.html { redirect_to [@applied_loan_detail.applied_loan.employee, @applied_loan_detail.applied_loan], notice: 'Applied loan detail was successfully created.' }
        format.json { render json: @applied_loan_detail, status: :created, location: @applied_loan_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @applied_loan_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /applied_loan_details/1
  # PUT /applied_loan_details/1.json
  def update
    @applied_loan_detail = AppliedLoanDetail.find(params[:id])

    respond_to do |format|
      if @applied_loan_detail.update_attributes(params[:applied_loan_detail])
        format.html { redirect_to [@applied_loan_detail.applied_loan.employee, @applied_loan_detail.applied_loan], notice: 'Applied loan detail was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @applied_loan_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applied_loan_details/1
  # DELETE /applied_loan_details/1.json
  def destroy
    @applied_loan_detail = AppliedLoanDetail.find(params[:id])
    @applied_loan_detail.destroy

    respond_to do |format|
      format.html { redirect_to employee_applied_loan_path(params[:employee_id],params[:applied_loan_id]) }
      format.json { head :ok }
    end
  end
end

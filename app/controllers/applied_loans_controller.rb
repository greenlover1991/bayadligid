class AppliedLoansController < ApplicationController
  # GET /applied_loans
  # GET /applied_loans.json
  def index
    @applied_loans = AppliedLoan.find_all_by_employee_id(params[:employee_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @applied_loans }
    end
  end

  # GET /applied_loans/1
  # GET /applied_loans/1.json
  def show
    @applied_loan = AppliedLoan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @applied_loan }
    end
  end

  # GET /applied_loans/new
  # GET /applied_loans/new.json
  def new
    @applied_loan = AppliedLoan.new(:employee_id=>params[:employee_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @applied_loan }
    end
  end

  # GET /applied_loans/1/edit
  def edit
    @applied_loan = AppliedLoan.find(params[:id])
  end

  # POST /applied_loans
  # POST /applied_loans.json
  def create
    @applied_loan = AppliedLoan.new(params[:applied_loan])

    respond_to do |format|
      if @applied_loan.save
        format.html { redirect_to [@applied_loan.employee, @applied_loan], notice: 'Applied loan was successfully created.' }
        format.json { render json: @applied_loan, status: :created, location: @applied_loan }
      else
        format.html { render action: "new" }
        format.json { render json: @applied_loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /applied_loans/1
  # PUT /applied_loans/1.json
  def update
    @applied_loan = AppliedLoan.find(params[:id])

    respond_to do |format|
      if @applied_loan.update_attributes(params[:applied_loan])
        format.html { redirect_to [@applied_loan.employee, @applied_loan], notice: 'Applied loan was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @applied_loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applied_loans/1
  # DELETE /applied_loans/1.json
  def destroy
    @applied_loan = AppliedLoan.find(params[:id])
    @applied_loan.destroy

    respond_to do |format|
      format.html { redirect_to employee_url(params[:employee_id]) }
      format.json { head :ok }
    end
  end
  
end

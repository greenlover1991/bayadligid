class PayrollsController < ApplicationController
  # GET /payrolls
  # GET /payrolls.json
  def index
  	@company = Company.find(params[:company_id])
    @payrolls = @company.payrolls

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payrolls }
    end
  end

  # GET /payrolls/1
  # GET /payrolls/1.json
  def show
		@payroll = Payroll.find_by_id_and_company_id(params[:id],params[:company_id])
		@payroll_details = @payroll.payroll_details.joins(:employee).order(:branch_id).includes(:employee)
		respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @payroll }
    end
  end

  # GET /payrolls/new
  # GET /payrolls/new.json
  def new
  	@company = Company.find(params[:company_id])
    @payroll = Payroll.new
		@company_employees = Employee.company_employees(@company.id)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payroll }
    end
  end

  # GET /payrolls/1/edit
  def edit
  	@company = Company.find(params[:company_id])
    @payroll = Payroll.find(params[:id])
    @payroll_details = @payroll.payroll_details.joins(:employee).order(:branch_id).includes(:employee)
  end

  # POST /payrolls
  # POST /payrolls.json
  def create
    @payroll = Payroll.new(params[:payroll])
    respond_to do |format|
      if @payroll.save
      	pds = []
      	payroll_details = params[:payroll_detail]
      	payroll_details.each do |pd|
      		pd["payroll_id"] = @payroll.id
      		pds << pd
      	end
      	PayrollDetail.create(pds)
        format.html { redirect_to daily_payroll_company_payroll_path(@payroll.company_id,@payroll.id), notice: 'Payroll was successfully created.' }
        format.json { render json: @payroll, status: :created, location: @payroll }
      else
        format.html { render action: "new" }
        format.json { render json: @payroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /payrolls/1
  # PUT /payrolls/1.json
  def update
    @payroll = Payroll.find(params[:id])

    respond_to do |format|
      if @payroll.update_attributes(params[:payroll])
	      pd_ids = []
	      pd_values = []
      	payroll_details = params[:payroll_detail]
      	payroll_details.each do |pd|
      		pd_ids << pd["id"]
      		pd.delete("id")
      		pd_values << pd
      	end
      	PayrollDetail.update(pd_ids, pd_values)
        format.html { redirect_to daily_payroll_company_payroll_path(@payroll.company_id,@payroll.id), notice: 'Payroll was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @payroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payrolls/1
  # DELETE /payrolls/1.json
  def destroy
    @payroll = Payroll.find_by_id_and_company_id(params[:id], params[:company_id])
    @payroll.destroy

    respond_to do |format|
      format.html { redirect_to company_payrolls_url(params[:company_id]) }
      format.json { head :ok }
    end
  end
  
  def daily_payroll
		init_report
  end
  
  def daily_payroll_details
		init_report
  end
  
  def monthly_payroll
		init_report
  end
  
  def monthly_payroll_details
		init_report
  end
  
  def prooflist
		init_report
  end
  
  def payslip
  	redirect_to '/' if params[:employee_id].nil?
  	
  	@payroll_detail = PayrollDetail.find_by_payroll_id_and_employee_id(params[:id], params[:employee_id])
  end
  
  private
		def init_report
			@payroll = Payroll.find_by_id_and_company_id(params[:id],params[:company_id])
			@payroll_details = @payroll.payroll_details.joins(:employee).order(:branch_id).includes(:employee)
			respond_to do |format|
				format.html 
				format.json { render json: @payroll }
			end
		end
end

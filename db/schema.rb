# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120119061901) do

  create_table "applied_loan_details", :force => true do |t|
    t.integer  "applied_loan_id"
    t.float    "amount"
    t.date     "date_applied"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applied_loan_details", ["applied_loan_id"], :name => "index_applied_loan_details_on_applied_loan_id"

  create_table "applied_loans", :force => true do |t|
    t.integer  "employee_id",         :null => false
    t.integer  "loan_id",             :null => false
    t.date     "date_started",        :null => false
    t.date     "date_ended",          :null => false
    t.float    "amount_per_interval", :null => false
    t.float    "original_amount",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "interval_type"
  end

  add_index "applied_loans", ["employee_id"], :name => "index_applied_loans_on_employee_id"
  add_index "applied_loans", ["loan_id"], :name => "index_applied_loans_on_loan_id"

  create_table "branches", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "company_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "branches", ["company_id"], :name => "index_branches_on_company_id"

  create_table "companies", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies_users", :id => false, :force => true do |t|
    t.integer "company_id", :null => false
    t.integer "user_id",    :null => false
  end

  create_table "employees", :force => true do |t|
    t.string   "first_name",                             :null => false
    t.string   "middle_name",                            :null => false
    t.string   "last_name",                              :null => false
    t.text     "address"
    t.string   "phone_no"
    t.string   "mobile_no"
    t.date     "birthdate"
    t.date     "date_hired"
    t.date     "date_regularized"
    t.date     "date_left"
    t.string   "sss_no"
    t.string   "philhealth_no"
    t.string   "pagibig_no"
    t.string   "civil_status"
    t.string   "status",           :default => "Active", :null => false
    t.integer  "branch_id",                              :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employees", ["branch_id"], :name => "index_employees_on_branch_id"

  create_table "holidays", :force => true do |t|
    t.string   "name",                                   :null => false
    t.string   "holiday_type",    :default => "Regular", :null => false
    t.date     "date_of_holiday",                        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loans", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "monthly_rates", :force => true do |t|
    t.integer  "employee_id",  :null => false
    t.float    "rate",         :null => false
    t.date     "date_started", :null => false
    t.date     "date_ended"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "monthly_rates", ["employee_id"], :name => "index_monthly_rates_on_employee_id"

  create_table "payroll_details", :force => true do |t|
    t.integer  "payroll_id"
    t.integer  "employee_id"
    t.float    "days_worked"
    t.float    "hours_regular_overtime"
    t.float    "hours_special_overtime"
    t.float    "hours_legal_overtime"
    t.float    "hours_day_off_overtime"
    t.integer  "days_legal_holiday"
    t.float    "days_absent"
    t.float    "minutes_tardy"
    t.float    "adjustment"
    t.float    "other_deduction"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "sss_loan"
    t.float    "hdmf_loan"
    t.float    "salary_loan"
    t.float    "calamity_loan"
    t.float    "philhealth_loan"
    t.float    "sss_contribution"
    t.float    "philhealth_contribution"
    t.float    "hdmf_contribution"
    t.float    "with_tax"
    t.float    "losses"
    t.float    "cash_advance"
  end

  add_index "payroll_details", ["employee_id"], :name => "index_payroll_details_on_employee_id"
  add_index "payroll_details", ["payroll_id"], :name => "index_payroll_details_on_payroll_id"

  create_table "payrolls", :force => true do |t|
    t.date     "date_started", :null => false
    t.date     "date_ended",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "roles_id", :null => false
    t.integer "user_id",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login",       :null => false
    t.string   "password",    :null => false
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["employee_id"], :name => "index_users_on_employee_id"

end

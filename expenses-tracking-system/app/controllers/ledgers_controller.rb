class LedgersController < ApplicationController
  def create
      ledger = Ledger.new(ledger_params)
      if ledger.save
        render json: ledger
      else
        render json: { errors: ledger.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
  def update
      ledger = Ledger.find(params[:id])
      if ledger.update(ledger_params)
        render json: ledger
      else
        render json: { errors: ledger.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      ledger = Ledger.find(params[:id])
      ledger.destroy
      head :no_content
    end
  
  def summarize
      ledgers = Ledger.where(user_id: params[:user_id], date: params[:start_date]..params[:end_date])
      credits = ledgers.where(type: 'credit').sum(:amount)
      debits = ledgers.where(type: 'debit').sum(:amount)
      balance = credits - debits
      render json: { credits: credits, debits: debits, balance: balance }
    end
  
    private
  
  def ledger_params
      params.require(:ledger).permit(:user_id, :date, :description, :type, :amount)
    end
  end
  
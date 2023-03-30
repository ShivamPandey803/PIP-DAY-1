require 'will_paginate/array'

class LedgersController < ApplicationController
  def index
    user_ledgers = Ledger.where(user_id: params[:user_id]).order(created_at: :desc)
    page = params[:page] || 1
    per_page = params[:per_page] || 10
    sort = params[:sort] || 'date'
    if sort.start_with?('-')
      user_ledgers = user_ledgers.order(sort[1..-1] + ' DESC')
    else
      user_ledgers = user_ledgers.order(sort)
    end
    ledgers = user_ledgers.paginate(page: page, per_page: per_page)
    render json: ledgers, include: { user: { only: [:id, :first_name, :last_name] } }
  end

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
    credits = ledgers.where(transaction_type: 'credit').sum(:amount)
    debits = ledgers.where(transaction_type: 'debit').sum(:amount)
    balance = credits - debits
    render json: { credits: credits, debits: debits, balance: balance }
  end

  private

  def ledger_params
    params.require(:ledger).permit(:user_id, :date, :description, :transaction_type, :amount)
  end
end

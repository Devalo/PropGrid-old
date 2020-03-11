# frozen_string_literal: true

class Tenants::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end
  puts "DETTE ER EN TEST"
  puts "DETTE ER EN TEST"
  puts "DETTE ER EN TEST"
  puts "DETTE ER EN TEST"
  puts "DETTE ER EN TEST"
  puts "DETTE ER EN TEST"
  puts "DETTE ER EN TEST"
  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

  # protected
  protected
    puts "IS THIS EVEN WORKING??????"
    puts "IS THIS EVEN WORKING??????"
    puts "IS THIS EVEN WORKING??????"
    puts "IS THIS EVEN WORKING??????"
    def after_confirmation_path_for(resource_name, resource)
      token = resource.send(:set_reset_password_token)
      edit_tenant_password_path(resource, reset_password_token: token)
    end

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
end

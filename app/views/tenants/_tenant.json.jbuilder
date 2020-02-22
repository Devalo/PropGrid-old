json.extract! tenant, :id, :first_name, :last_name, :email, :phone_number, :social_sec_number, :created_at, :updated_at
json.url tenant_url(tenant, format: :json)

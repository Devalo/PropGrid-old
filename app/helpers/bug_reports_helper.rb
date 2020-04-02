module BugReportsHelper

  def ticket_from(ticket)
    if ticket.user_id == nil
      tenant = Tenant.find(ticket.tenant_id)
      return tenant.email
    else
      user = User.find(ticket.user_id)
      return user.email
    end
  end

  def ticket_read?(status)
    if status == false
      return "Ulest"
    else
      return "Lest"
    end
  end

end

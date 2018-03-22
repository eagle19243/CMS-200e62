class RegistrantMailer < ActionMailer::Base

  def welcome_email(registrant)
    @registrant = registrant
    attach_file 'hero.jpg', image_path('email-pattern@2x.gif')
    attach_file 'logo.png', image_path('200e62-logo@2x.png')
    mail(to: registrant.email, subject: '200 E 62: Thank you for registering')
  end

  def registrant_info(registrant)
    @registrant = registrant
    if Rails.application.secrets.bcc_email.present?
      mail(to: Rails.application.secrets.bcc_email, subject: '200 E 62 - New Registrant')
    end
  end

  protected

  def image_path(name)
    Rails.root.join "app", "assets", "images", name
  end

  def attach_file(name, path)
    attachments.inline[name] = File.read(path)
  end

end
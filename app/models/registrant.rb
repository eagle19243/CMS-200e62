require 'csv'

class Registrant < ActiveRecord::Base
  include Brb::Model::Full

  validates_presence_of :name, :email
  validates_uniqueness_of :email
  validates :residence_size, exclusion: { in: ['Residence Size'], message: 'must be selected' }
  validates :referrer, exclusion: { in: ['How did you hear about us?'], message: 'must be selected' }
  validate :real_email_address

  has_heading 'Date', link: 'created_at', display: :formatted_registered_date, default: true
  has_heading 'Name',    link: 'name'
  has_heading 'Residence Size',  link: 'residence_size'
  has_heading 'Email',   link: 'email'
  has_heading 'Phone',   link: 'phone'
  has_heading 'Broker',  link: 'is_a_broker'

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      columns_to_use = column_names
      columns_to_use.delete('updated_at')
      csv << columns_to_use
      all.each do |registrant|
        csv << registrant.attributes.values_at(*columns_to_use)
      end
    end
  end

  def formatted_registered_date
    created_at.strftime('%b %d, %Y')
  end

  def self.residence_size_options
    [
      'Residence Size',
      '1BR — $1,975,000',
      '2BR — $2,795,000',
      '3BR — $3,495,000',
      '4BR — $5,995,000'
    ]
  end

  def self.referrer_options
    ['How did you hear about us?',
    'Neighborhood (Residence)',
    'Neighborhood (Work)',
    'Sign',
    'Website',
    'Broker',
    'Corcoran.com',
    'Streeteasy',
    'New York Times',
    'Wall Street Journal',
    'Other Newspaper / Magazine',
    'Referral',
    'Google',
    'Other']
  end

  private

  def real_email_address
    unless email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      errors.add(:email, 'must be a valid address')
    end
  end

end

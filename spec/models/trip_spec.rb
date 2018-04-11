require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'validations' do
    it{should validate_presence_of :duration}
    it{should validate_presence_of :start_date}
    it{should validate_presence_of :start_station_name}
    it{should validate_presence_of :start_station_id}
    it{should validate_presence_of  :end_date}
    it{should validate_presence_of :end_station_name}
    it{should validate_presence_of :end_station_id}
    it{should validate_presence_of :bike_id}
    it{should validate_presence_of :subscription_type}
  end

  describe 'relationships' do
    it{should respond_to :stations}
    it{is_expected.to belong_to(:condition)}
  end
end

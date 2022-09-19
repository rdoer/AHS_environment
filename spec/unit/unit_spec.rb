# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Event, type:  :model do
    subject do
        described_class.new(
            event_title: '1st Meeting', 
            event_description: 'General Meeting', 
            event_points: 5, 
            event_passcode: 'Test',
            event_location: 'ZACH-350',
            event_start: DateTime.new(2022, 9, 18, 8, 10),
            event_end: DateTime.new(2022, 9, 18, 9, 0)
        )
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    it 'is invalid with out event title' do
        subject.event_title = nil 
        expect(subject).not_to be_valid
    end
    
    it 'is invalid without event description' do
        subject.event_description = nil
        expect(subject).not_to be_valid
    end

    it 'is invalid without event points' do
        subject.event_points = nil 
        expect(subject).not_to be_valid 
    end 

    # it 'is invalid with negative event points' do
    #     subject.event_points = -1
    #     expect(subject).not_to be_valid
    # end 

    it 'is invalid without an event passcode' do
        subject.event_passcode = nil 
        expect(subject).not_to be_valid 
    end

    it 'is invalid without an event location' do
        subject.event_location = nil 
        expect(subject).not_to be_valid
    end

    it 'is invalid without en event start' do 
        subject.event_start = nil 
        expect(subject).not_to be_valid
    end

    it 'is invalid without an event end' do
        subject.event_end = nil 
        expect(subject).not_to be_valid
    end
end

RSpec.describe User, type:  :model do
    subject do
        described_class.new(first_name: 'John', last_name: 'Doe', email: 'johndoe@gmail.com', password: '123', point: 0, privileges_id: 0)
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    it 'is invalid without first name' do
        subject.first_name = nil 
        expect(subject).not_to be_valid
    end
    
    it 'is invalid without last name' do
        subject.last_name = nil
        expect(subject).not_to be_valid
    end

    it 'is invalid without email' do
        subject.email = nil
        expect(subject).not_to be_valid
    end
end




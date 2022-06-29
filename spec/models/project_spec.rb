require 'rails_helper'

RSpec.describe Project, type: :model do
  before :all do
    Project.destroy_all
  end

  describe 'Validations' do
    subject { build :project }

    context 'title' do
      it 'should have a title' do
        subject.title = nil

        expect(subject).to_not be_valid
      end

      it 'should have more than 3 characters' do
        subject.title = 'Da'
        subject.save

        expect(subject).to_not be_valid
      end
    end

    context 'image files' do
      it 'should have images' do
        subject.images = nil

        expect(subject).to_not be_valid
      end
    end

    context 'tags' do
      it 'should have tags' do
        subject.tags = nil

        expect(subject).to_not be_valid
      end
    end

    context 'description' do
      it 'should have a description' do
        subject.description = nil
        subject.save

        expect(subject).to_not be_valid
      end

      it 'should be larger than 100 characters' do
        subject.description = 'something'

        expect(subject).to_not be_valid
      end
    end

    context 'live' do
      it 'should have a live link' do
        subject.live = nil

        expect(subject).to_not be_valid
      end
    end

    context 'source' do
      it 'should have a source link' do
        subject.source = nil

        expect(subject).to_not be_valid
      end
    end

    context 'demo' do
      it 'should have a demo link' do
        subject.demo = nil

        expect(subject).to_not be_valid
      end
    end
  end
end

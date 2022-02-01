require 'rails_helper'

RSpec.describe Task, type: :model do
    let(:task){ build(:task) }
    describe 'タイトルとコンテンツにバリデーション' do
        subject { task }
        context '正常系' do
          it 'タイトルとコンテンツがある場合' do
            is_expected.to be_valid
          end
        end
    
        context '異常系' do
          it 'タイトルが空の場合' do
            task.title = nil
            is_expected.to be_invalid
          end
    
          it 'コンテンツが空の場合' do
            task.content = nil
            is_expected.to be_invalid
          end
        end
      end
    end

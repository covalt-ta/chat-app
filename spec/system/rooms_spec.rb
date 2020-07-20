require 'rails_helper'

RSpec.describe "チャットルームの削除機能", type: :system do
  before do
    @room_user = FactoryBot.create(:room_user)
  end
  it 'チャットルームを削除すると、関連するメッセージがすべて削除されていること' do
    # サインインする
    sign_in(@room_user.user)
    # 作成されたチャットルームへ遷移する
    click_on(@room_user.room.name)
    # メッセージ情報を5つDBに追加する
    5.times do |n|
      fill_in 'message_content', with: "#{n}メッセージ"
      click_on '送信'
    end
    # 「チャットを終了する」ボタンをクリックすることで、作成した5つのメッセージが削除されていることを期待する
    expect{
      find_link("チャットを終了する", href: room_path(@room_user.room)).click
    }.to change { Message.count }.by(-5)
    # ルートページに遷移されることを期待する
    expect(current_path).to eq root_path
  end
end

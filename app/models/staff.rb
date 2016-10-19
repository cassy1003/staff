require 'google_drive'
require 'csv'

class Staff < ApplicationRecord
  def self.download
    session = GoogleDrive::Session.from_service_account_key('google_auth.json')
    ws = session.spreadsheet_by_key("1o53mGae2Y5fuqXlCJIMGK3uN_Nkn2cTDEKLzz8asty0").worksheets[0]
    CSV.open("lib/assets/staffs.csv", "wb") do |csv|
      1.upto(ws.num_rows) do |row|
        items = []
        1.upto(ws.num_cols) do |col|
          items << ws.cells[[row, col]]
        end
        csv << items
      end
    end
  end

  def self.all
    CSV.foreach('lib/assets/staffs.csv', headers: true).map do |staff|
      {
        id: staff['staff_id'],
        firstname: {
          jp: staff['jp_firstname'],
          en: staff['en_firstname']
        },
        familyname: {
          jp: staff['jp_familyname'],
          en: staff['en_familyname']
        },
        roll: staff['roll'],
        slide: staff['slide_id'],
        thumbnail: staff['thumbnail_path'],
        image: staff['image_path'],
        about: staff['about'],
        comment: staff['comment'],
        strength_finder: [
          staff['strengthfinder1'],
          staff['strengthfinder2'],
          staff['strengthfinder3'],
          staff['strengthfinder4'],
          staff['strengthfinder5']
        ]
      }
    end
  end

  def self.types
    {
      0 => '正社員',
      100000 => 'ケンブリッジ',
      200000 => '契約社員'
    }
  end

  def self.strength_finders
    ['アレンジ',
     '運命思考',
     '回復志向',
     '学習欲',
     '活発性',
     '共感性',
     '競争性',
     '規律性',
     '原点思考',
     '公平性',
     '個別化',
     'コミュニケーション',
     '最上志向',
     '自我',
     '自己確信',
     '社交性',
     '収集心',
     '指令性',
     '慎重さ',
     '信念',
     '親密性',
     '成長促進',
     '責任感',
     '戦略性',
     '達成欲',
     '着想',
     '調和性',
     '適応性',
     '内省',
     '分析思考',
     '包含',
     'ポジティブ',
     '未来志向',
     '目標志向']
  end
end

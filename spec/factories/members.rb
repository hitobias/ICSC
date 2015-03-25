FactoryGirl.define do
  factory :member do
    no 1
firstname "MyString"
lastname "MyString"
chinese_name "MyString"
gender "MyString"
relationship "MyString"
country "MyString"
church "MyString"
pick_up false
arrived_date "2015-03-25"
arrvied_time "2015-03-25 09:33:47"
arrived_airport "MyString"
arrived_flight_no "MyString"
drop_off false
departed_date "2015-03-25"
departed_time "2015-03-25 09:33:47"
departed_airport "MyString"
departed_flight_no "MyString"
hospitality false
conference_option "MyString"
comments "MyText"
enabled false
donated false
  end

end

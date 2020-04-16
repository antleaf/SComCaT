require 'open-uri'

GOOGLE_SHEET_ID_HASH = {
  :AdoptionLevel =>'https://docs.google.com/spreadsheets/d/e/2PACX-1vSdHTQzG7JGL3kkH76z4JEgYpj6cN_abHgLkLEnn8cmAS7_L77iBVMu5gqJKPcVVBnhdpmcyYRGHAXz/pub?gid=903201348&single=true&output=csv',
  :Category =>'https://docs.google.com/spreadsheets/d/e/2PACX-1vSdHTQzG7JGL3kkH76z4JEgYpj6cN_abHgLkLEnn8cmAS7_L77iBVMu5gqJKPcVVBnhdpmcyYRGHAXz/pub?gid=1373825745&single=true&output=csv',
  :ReadinessLevel =>'https://docs.google.com/spreadsheets/d/e/2PACX-1vSdHTQzG7JGL3kkH76z4JEgYpj6cN_abHgLkLEnn8cmAS7_L77iBVMu5gqJKPcVVBnhdpmcyYRGHAXz/pub?gid=1296095155&single=true&output=csv',
  :Technology =>'https://docs.google.com/spreadsheets/d/e/2PACX-1vSdHTQzG7JGL3kkH76z4JEgYpj6cN_abHgLkLEnn8cmAS7_L77iBVMu5gqJKPcVVBnhdpmcyYRGHAXz/pub?gid=0&single=true&output=csv',
  :Function =>'https://docs.google.com/spreadsheets/d/e/2PACX-1vSdHTQzG7JGL3kkH76z4JEgYpj6cN_abHgLkLEnn8cmAS7_L77iBVMu5gqJKPcVVBnhdpmcyYRGHAXz/pub?gid=1788718343&single=true&output=csv',
  :TechnologyFunction =>'https://docs.google.com/spreadsheets/d/e/2PACX-1vSdHTQzG7JGL3kkH76z4JEgYpj6cN_abHgLkLEnn8cmAS7_L77iBVMu5gqJKPcVVBnhdpmcyYRGHAXz/pub?gid=1137981981&single=true&output=csv',
  :TechnologyCategory =>'https://docs.google.com/spreadsheets/d/e/2PACX-1vSdHTQzG7JGL3kkH76z4JEgYpj6cN_abHgLkLEnn8cmAS7_L77iBVMu5gqJKPcVVBnhdpmcyYRGHAXz/pub?gid=1364226668&single=true&output=csv'
}

RELATIONSHIPS_SHEET_URL = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vSdHTQzG7JGL3kkH76z4JEgYpj6cN_abHgLkLEnn8cmAS7_L77iBVMu5gqJKPcVVBnhdpmcyYRGHAXz/pub?gid=2072372834&single=true&output=csv'

def download_google_sheet(csv_data_root, name_sym)
  open("#{csv_data_root}/#{name_sym.to_s}.csv", 'wb') do |file|
    file << open(GOOGLE_SHEET_ID_HASH[name_sym]).read
  end
end

def download_all_google_data(csv_data_root)
  GOOGLE_SHEET_ID_HASH.each_pair do |k,v|
    download_google_sheet(csv_data_root,k)
  end
  open("#{csv_data_root}/Relationship.csv", 'wb') do |file|
    file << open(RELATIONSHIPS_SHEET_URL).read
  end

end
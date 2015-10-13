require 'pry'

class PetitionGenerator
  attr_reader :personal_information, :info_hash, :pdftk
  attr_accessor :info_hash, :user


  def initialize(personal_information)
    @pdftk = PdfForms.new('/usr/local/bin/pdftk')
    @personal_information = personal_information
    @user = personal_information.user
    @info_hash = {}
  end

  def parse_data
    info_hash["form1[0].#subform[0].TextField1[0]"] = user.first_name + " " + user.last_name
    info_hash["form1[0].#subform[0].TextField2[0]"] = "#{ @personal_information.date_of_birth }"
    info_hash["form1[0].#subform[0].TextField3[0]"] = "#{ @personal_information.previous_name }"
    info_hash["form1[0].#subform[0].TextField4[0]"] = "#{ @personal_information.address }"
    info_hash["form1[0].#subform[0].TextField5[0]"] = "#{ @personal_information.city }"
    info_hash["form1[0].#subform[0].TextField6[0]"] = "#{ @personal_information.state }"
    info_hash["form1[0].#subform[0].TextField7[0]"] = "#{ @personal_information.zip }"
    info_hash["form1[0].#subform[0].TextField8[0]"] = "#{ @personal_information.occupation }"
    info_hash["form1[0].#subform[0].TextField10[0]"] = "#{ @personal_information.hometown }"
    info_hash["form1[0].#subform[0].TextField11[0]"] = "#{ @personal_information.father_name }"
    info_hash["form1[0].#subform[0].TextField12[0]"] = "#{ @personal_information.mother_maiden }"
    info_hash["form1[0].#subform[0].TextField13[0]"] = "#{ @personal_information.spouse_name }"

    user.records.each do |record|
      if record.felony && record.eligible?
        info_hash["form1[0].#subform[0].CheckBox1[1]"] = "1"
        info_hash["form1[0].#subform[0].CheckBox1[2]"] = "1"
        info_hash["form1[0].#subform[0].CheckBox1[5]"] = "1"
        info_hash["form1[0].#subform[0].CheckBox1[6]"] = "1"
      else
        info_hash["form1[0].#subform[0].CheckBox1[1]"] = "1"
        info_hash["form1[0].#subform[0].CheckBox1[5]"] = "1"
      end
    end
    info_hash
  end


  def fill_form(info)
    pdftk.fill_form './lib/assets/sealingpetition.pdf', "./lib/assets/mysealingpetition.pdf", info
  end
end

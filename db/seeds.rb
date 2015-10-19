unsealable_offenses = [ "Firearm Dealer's License, Improper Issue", "Unlicensed Sale of Ammunition",
  "Firearm Violation Sale", "Failure to Report Unlicensed Fireman", "False Statement on Firearm Application",
  "False Statement on Firearm ID Card Application", "Firearm Sale to Minor", "Firearm Violation License", "Firearm Permit, Impropr Issue",
  "Firearm, Alien Possess", "Perjury", "False Statement to State Agency", "False Return by Process Server", "False Report by Public Employee",
  "Bribe or Attempt to Bribe", "Court/Judge/Juror Picketing", "Witness, Juror, Police, Court Official, Intimidation", "Disrupt Court Proceedgings",
  "Withhold Evidence from Criminal Proceeding", "Juror Accept Bribe", "Witness, Employer Discharge", "Aid Felon Escape", "Aid Misdemeanant Escape",
  "Escape from Municiap Lockup", "Escape from Officer", "Escape from Penal Instituion", "Prison Guard Have Sex Relations with Prisoner", "Police Officer, Fail Assist"
  "Justice of Peace, Fail Assist", "Deliver Liquor to Prisoner", "Deliver Drugs to Prisoner", "Prisoner Bring Weapon or Drugs from Furlough",
  "False Alarm From Police Call Box", "Interfere with Firefighter", "Resist Arrest", "Impersonate Police Officer or Public Official", "False Name, Social Security to Police",
  "False Report of Motor Vehicle Theft", "Bribe Public Employee", "State Employee Imporper Compensation as Agent/Atty", "State Employee, Conflict of Interest",
  "State Employee, Interest in State Contract", "County Employee, Conflict of Interest", "County Employee, Improper Compensation", "Couny Employee Interest in City Contract",
  "Municipal Employee, Conflict of Interest", "Municipal Employee, Improper Compensation", "Municipal Employee, Interest in Municipal Contract",
  "Public Employee Standards of Conduct Violation", "Public Employee, False Statement in Financial Statement"
]

unsealable_offenses.each do | offense|
  UnsealableCrime.create!(offense_name: offense)
end

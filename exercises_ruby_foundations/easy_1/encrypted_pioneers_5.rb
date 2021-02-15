# Encrypted Pioneers

# The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant influence on the field. The names are in an encrypted form, though, using a simple (and incredibly weak) form of encryption called Rot13.

# Write a program that deciphers and prints each of these names .


ALPHABET_L1 = ('a'..'m').to_a
ALPHABET_L2 = ('n'..'z').to_a
ALPHABET_U1 = ('A'..'M').to_a
ALPHABET_U2 = ('N'..'Z').to_a

ENCRYPTED_NAMES = ['Nqn Ybirynpr',
'Tenpr Ubccre',
'Nqryr Tbyqfgvar',
'Nyna Ghevat',
'Puneyrf Onoontr',
'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
'Wbua Ngnanfbss',
'Ybvf Unvog',
'Pynhqr Funaaba',
'Fgrir Wbof',
'Ovyy Tngrf',
'Gvz Orearef-Yrr',
'Fgrir Jbmavnx',
'Xbaenq Mhfr',
'Fve Nagbal Ubner',
'Zneiva Zvafxl',
'Lhxvuveb Zngfhzbgb',
'Unllvz Fybavzfxv',
'Tregehqr Oynapu']

# p ALPHABET_L1
# p ALPHABET_L2
# p ALPHABET_U1
# p ALPHABET_U2

puts ""

decrypted_names = ENCRYPTED_NAMES.map do |enc_name|
  dec_name = ''
  enc_name.split('').each do |ec|
    if ec == ' ' || ec == '-'
      dec_name << ec 
      next
    end

    index = ALPHABET_L1.index(ec)
    if index != nil
      dc = ALPHABET_L2[index]
      dec_name << dc  
      next
    end
    
    index = ALPHABET_L2.index(ec)
    if index != nil
      dc = ALPHABET_L1[index]
      dec_name << dc  
      next
    end
    
    index = ALPHABET_U1.index(ec)
    if index != nil
      dc = ALPHABET_U2[index]
      dec_name << dc  
      next
    end
    
    index = ALPHABET_U2.index(ec)
    if index != nil
      dc = ALPHABET_U1[index]
      dec_name << dc  
      next
    end


  end
  puts dec_name
  dec_name
end

# p decrypted_names
puts ""

# LS Solution

ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypted_char|
    result + decipher_character(encrypted_char)
  end
end

def decipher_character(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
  else                         encrypted_char
  end
end

ENCRYPTED_PIONEERS.each do |encrypted_name|
  puts rot13(encrypted_name)
end
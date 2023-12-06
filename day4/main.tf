locals {

  input = file("input.txt")

  # Parses the input into pairs of [[winning numbers, ticket], ...]
  cards = chunklist([for list in regexall("(?:\\s+\\d+){2,}", local.input) : regexall("\\d+", list)], 2)

  # List of [winning numbers x ticket, ...]
  winning_numbers = [for card in local.cards : setintersection(card...)]

  # Points earned for each winning card
  prizes = [for numbers in local.winning_numbers : (length(numbers) > 0 ? pow(2, length(numbers) - 1) : 0)]

  originals = [for i, numbers in local.winning_numbers : (length(numbers) > 0 ? range(i + 2, i + 2 + length(numbers)) : [])]

  # At this point, the reader is encouraged to be thankful that I didn't opt for a depth-first search.
  # N.B. These lines are generated with Terraform - see ./gen/ - and 'terraform fmt'-ed
  # N.B.N.B. I tried to get dynamic modules to work using local_file and a local module, but it didn't work :(
  copies_0   = local.originals
  copies_1   = [for i, cards in local.copies_0 : flatten([for card in cards : local.originals[card - 1]])]
  copies_2   = [for i, cards in local.copies_1 : flatten([for card in cards : local.originals[card - 1]])]
  copies_3   = [for i, cards in local.copies_2 : flatten([for card in cards : local.originals[card - 1]])]
  copies_4   = [for i, cards in local.copies_3 : flatten([for card in cards : local.originals[card - 1]])]
  copies_5   = [for i, cards in local.copies_4 : flatten([for card in cards : local.originals[card - 1]])]
  copies_6   = [for i, cards in local.copies_5 : flatten([for card in cards : local.originals[card - 1]])]
  copies_7   = [for i, cards in local.copies_6 : flatten([for card in cards : local.originals[card - 1]])]
  copies_8   = [for i, cards in local.copies_7 : flatten([for card in cards : local.originals[card - 1]])]
  copies_9   = [for i, cards in local.copies_8 : flatten([for card in cards : local.originals[card - 1]])]
  copies_10  = [for i, cards in local.copies_9 : flatten([for card in cards : local.originals[card - 1]])]
  copies_11  = [for i, cards in local.copies_10 : flatten([for card in cards : local.originals[card - 1]])]
  copies_12  = [for i, cards in local.copies_11 : flatten([for card in cards : local.originals[card - 1]])]
  copies_13  = [for i, cards in local.copies_12 : flatten([for card in cards : local.originals[card - 1]])]
  copies_14  = [for i, cards in local.copies_13 : flatten([for card in cards : local.originals[card - 1]])]
  copies_15  = [for i, cards in local.copies_14 : flatten([for card in cards : local.originals[card - 1]])]
  copies_16  = [for i, cards in local.copies_15 : flatten([for card in cards : local.originals[card - 1]])]
  copies_17  = [for i, cards in local.copies_16 : flatten([for card in cards : local.originals[card - 1]])]
  copies_18  = [for i, cards in local.copies_17 : flatten([for card in cards : local.originals[card - 1]])]
  copies_19  = [for i, cards in local.copies_18 : flatten([for card in cards : local.originals[card - 1]])]
  copies_20  = [for i, cards in local.copies_19 : flatten([for card in cards : local.originals[card - 1]])]
  copies_21  = [for i, cards in local.copies_20 : flatten([for card in cards : local.originals[card - 1]])]
  copies_22  = [for i, cards in local.copies_21 : flatten([for card in cards : local.originals[card - 1]])]
  copies_23  = [for i, cards in local.copies_22 : flatten([for card in cards : local.originals[card - 1]])]
  copies_24  = [for i, cards in local.copies_23 : flatten([for card in cards : local.originals[card - 1]])]
  copies_25  = [for i, cards in local.copies_24 : flatten([for card in cards : local.originals[card - 1]])]
  copies_26  = [for i, cards in local.copies_25 : flatten([for card in cards : local.originals[card - 1]])]
  copies_27  = [for i, cards in local.copies_26 : flatten([for card in cards : local.originals[card - 1]])]
  copies_28  = [for i, cards in local.copies_27 : flatten([for card in cards : local.originals[card - 1]])]
  copies_29  = [for i, cards in local.copies_28 : flatten([for card in cards : local.originals[card - 1]])]
  copies_30  = [for i, cards in local.copies_29 : flatten([for card in cards : local.originals[card - 1]])]
  copies_31  = [for i, cards in local.copies_30 : flatten([for card in cards : local.originals[card - 1]])]
  copies_32  = [for i, cards in local.copies_31 : flatten([for card in cards : local.originals[card - 1]])]
  copies_33  = [for i, cards in local.copies_32 : flatten([for card in cards : local.originals[card - 1]])]
  copies_34  = [for i, cards in local.copies_33 : flatten([for card in cards : local.originals[card - 1]])]
  copies_35  = [for i, cards in local.copies_34 : flatten([for card in cards : local.originals[card - 1]])]
  copies_36  = [for i, cards in local.copies_35 : flatten([for card in cards : local.originals[card - 1]])]
  copies_37  = [for i, cards in local.copies_36 : flatten([for card in cards : local.originals[card - 1]])]
  copies_38  = [for i, cards in local.copies_37 : flatten([for card in cards : local.originals[card - 1]])]
  copies_39  = [for i, cards in local.copies_38 : flatten([for card in cards : local.originals[card - 1]])]
  copies_40  = [for i, cards in local.copies_39 : flatten([for card in cards : local.originals[card - 1]])]
  copies_41  = [for i, cards in local.copies_40 : flatten([for card in cards : local.originals[card - 1]])]
  copies_42  = [for i, cards in local.copies_41 : flatten([for card in cards : local.originals[card - 1]])]
  copies_43  = [for i, cards in local.copies_42 : flatten([for card in cards : local.originals[card - 1]])]
  copies_44  = [for i, cards in local.copies_43 : flatten([for card in cards : local.originals[card - 1]])]
  copies_45  = [for i, cards in local.copies_44 : flatten([for card in cards : local.originals[card - 1]])]
  copies_46  = [for i, cards in local.copies_45 : flatten([for card in cards : local.originals[card - 1]])]
  copies_47  = [for i, cards in local.copies_46 : flatten([for card in cards : local.originals[card - 1]])]
  copies_48  = [for i, cards in local.copies_47 : flatten([for card in cards : local.originals[card - 1]])]
  copies_49  = [for i, cards in local.copies_48 : flatten([for card in cards : local.originals[card - 1]])]
  copies_50  = [for i, cards in local.copies_49 : flatten([for card in cards : local.originals[card - 1]])]
  copies_51  = [for i, cards in local.copies_50 : flatten([for card in cards : local.originals[card - 1]])]
  copies_52  = [for i, cards in local.copies_51 : flatten([for card in cards : local.originals[card - 1]])]
  copies_53  = [for i, cards in local.copies_52 : flatten([for card in cards : local.originals[card - 1]])]
  copies_54  = [for i, cards in local.copies_53 : flatten([for card in cards : local.originals[card - 1]])]
  copies_55  = [for i, cards in local.copies_54 : flatten([for card in cards : local.originals[card - 1]])]
  copies_56  = [for i, cards in local.copies_55 : flatten([for card in cards : local.originals[card - 1]])]
  copies_57  = [for i, cards in local.copies_56 : flatten([for card in cards : local.originals[card - 1]])]
  copies_58  = [for i, cards in local.copies_57 : flatten([for card in cards : local.originals[card - 1]])]
  copies_59  = [for i, cards in local.copies_58 : flatten([for card in cards : local.originals[card - 1]])]
  copies_60  = [for i, cards in local.copies_59 : flatten([for card in cards : local.originals[card - 1]])]
  copies_61  = [for i, cards in local.copies_60 : flatten([for card in cards : local.originals[card - 1]])]
  copies_62  = [for i, cards in local.copies_61 : flatten([for card in cards : local.originals[card - 1]])]
  copies_63  = [for i, cards in local.copies_62 : flatten([for card in cards : local.originals[card - 1]])]
  copies_64  = [for i, cards in local.copies_63 : flatten([for card in cards : local.originals[card - 1]])]
  copies_65  = [for i, cards in local.copies_64 : flatten([for card in cards : local.originals[card - 1]])]
  copies_66  = [for i, cards in local.copies_65 : flatten([for card in cards : local.originals[card - 1]])]
  copies_67  = [for i, cards in local.copies_66 : flatten([for card in cards : local.originals[card - 1]])]
  copies_68  = [for i, cards in local.copies_67 : flatten([for card in cards : local.originals[card - 1]])]
  copies_69  = [for i, cards in local.copies_68 : flatten([for card in cards : local.originals[card - 1]])]
  copies_70  = [for i, cards in local.copies_69 : flatten([for card in cards : local.originals[card - 1]])]
  copies_71  = [for i, cards in local.copies_70 : flatten([for card in cards : local.originals[card - 1]])]
  copies_72  = [for i, cards in local.copies_71 : flatten([for card in cards : local.originals[card - 1]])]
  copies_73  = [for i, cards in local.copies_72 : flatten([for card in cards : local.originals[card - 1]])]
  copies_74  = [for i, cards in local.copies_73 : flatten([for card in cards : local.originals[card - 1]])]
  copies_75  = [for i, cards in local.copies_74 : flatten([for card in cards : local.originals[card - 1]])]
  copies_76  = [for i, cards in local.copies_75 : flatten([for card in cards : local.originals[card - 1]])]
  copies_77  = [for i, cards in local.copies_76 : flatten([for card in cards : local.originals[card - 1]])]
  copies_78  = [for i, cards in local.copies_77 : flatten([for card in cards : local.originals[card - 1]])]
  copies_79  = [for i, cards in local.copies_78 : flatten([for card in cards : local.originals[card - 1]])]
  copies_80  = [for i, cards in local.copies_79 : flatten([for card in cards : local.originals[card - 1]])]
  copies_81  = [for i, cards in local.copies_80 : flatten([for card in cards : local.originals[card - 1]])]
  copies_82  = [for i, cards in local.copies_81 : flatten([for card in cards : local.originals[card - 1]])]
  copies_83  = [for i, cards in local.copies_82 : flatten([for card in cards : local.originals[card - 1]])]
  copies_84  = [for i, cards in local.copies_83 : flatten([for card in cards : local.originals[card - 1]])]
  copies_85  = [for i, cards in local.copies_84 : flatten([for card in cards : local.originals[card - 1]])]
  copies_86  = [for i, cards in local.copies_85 : flatten([for card in cards : local.originals[card - 1]])]
  copies_87  = [for i, cards in local.copies_86 : flatten([for card in cards : local.originals[card - 1]])]
  copies_88  = [for i, cards in local.copies_87 : flatten([for card in cards : local.originals[card - 1]])]
  copies_89  = [for i, cards in local.copies_88 : flatten([for card in cards : local.originals[card - 1]])]
  copies_90  = [for i, cards in local.copies_89 : flatten([for card in cards : local.originals[card - 1]])]
  copies_91  = [for i, cards in local.copies_90 : flatten([for card in cards : local.originals[card - 1]])]
  copies_92  = [for i, cards in local.copies_91 : flatten([for card in cards : local.originals[card - 1]])]
  copies_93  = [for i, cards in local.copies_92 : flatten([for card in cards : local.originals[card - 1]])]
  copies_94  = [for i, cards in local.copies_93 : flatten([for card in cards : local.originals[card - 1]])]
  copies_95  = [for i, cards in local.copies_94 : flatten([for card in cards : local.originals[card - 1]])]
  copies_96  = [for i, cards in local.copies_95 : flatten([for card in cards : local.originals[card - 1]])]
  copies_97  = [for i, cards in local.copies_96 : flatten([for card in cards : local.originals[card - 1]])]
  copies_98  = [for i, cards in local.copies_97 : flatten([for card in cards : local.originals[card - 1]])]
  copies_99  = [for i, cards in local.copies_98 : flatten([for card in cards : local.originals[card - 1]])]
  copies_100 = [for i, cards in local.copies_99 : flatten([for card in cards : local.originals[card - 1]])]

}

output "part1" {
  value = sum(local.prizes)
}

output "part2" {
  value = length(flatten([
    # N.B. The following lines are generated from the 'list' output of ./gen/
    local.copies_0,
    local.copies_1,
    local.copies_2,
    local.copies_3,
    local.copies_4,
    local.copies_5,
    local.copies_6,
    local.copies_7,
    local.copies_8,
    local.copies_9,
    local.copies_10,
    local.copies_11,
    local.copies_12,
    local.copies_13,
    local.copies_14,
    local.copies_15,
    local.copies_16,
    local.copies_17,
    local.copies_18,
    local.copies_19,
    local.copies_20,
    local.copies_21,
    local.copies_22,
    local.copies_23,
    local.copies_24,
    local.copies_25,
    local.copies_26,
    local.copies_27,
    local.copies_28,
    local.copies_29,
    local.copies_30,
    local.copies_31,
    local.copies_32,
    local.copies_33,
    local.copies_34,
    local.copies_35,
    local.copies_36,
    local.copies_37,
    local.copies_38,
    local.copies_39,
    local.copies_40,
    local.copies_41,
    local.copies_42,
    local.copies_43,
    local.copies_44,
    local.copies_45,
    local.copies_46,
    local.copies_47,
    local.copies_48,
    local.copies_49,
    local.copies_50,
    local.copies_51,
    local.copies_52,
    local.copies_53,
    local.copies_54,
    local.copies_55,
    local.copies_56,
    local.copies_57,
    local.copies_58,
    local.copies_59,
    local.copies_60,
    local.copies_61,
    local.copies_62,
    local.copies_63,
    local.copies_64,
    local.copies_65,
    local.copies_66,
    local.copies_67,
    local.copies_68,
    local.copies_69,
    local.copies_70,
    local.copies_71,
    local.copies_72,
    local.copies_73,
    local.copies_74,
    local.copies_75,
    local.copies_76,
    local.copies_77,
    local.copies_78,
    local.copies_79,
    local.copies_80,
    local.copies_81,
    local.copies_82,
    local.copies_83,
    local.copies_84,
    local.copies_85,
    local.copies_86,
    local.copies_87,
    local.copies_88,
    local.copies_89,
    local.copies_90,
    local.copies_91,
    local.copies_92,
    local.copies_93,
    local.copies_94,
    local.copies_95,
    local.copies_96,
    local.copies_97,
    local.copies_98,
    local.copies_99,
    local.copies_100,
  ])) + length(local.cards)
}
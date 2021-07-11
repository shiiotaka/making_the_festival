10.times do |n|
  Artist.seed do |s|
    s.name = "アーティスト#{n}"
  end
end

Artist.seed(:id,
            { name: 'Sex Pistols'},
            { name: 'The Clash' },
            { name: 'MOTORHEAD' },
            { name: 'Ramones' },
            { name: 'Bad Religion' },
            { name: 'KORN' },
            { name: 'The Offspring' },
            { name: 'blink182' },
            { name: 'NOFX' },
            { name: 'GREEN DAY' }
           )

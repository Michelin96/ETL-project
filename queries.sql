SELECT j.*, n.rotten_tomatoes_prcnt, (averagerating)*10 as imdb_prcnt
FROM junction j
inner join netflix_rts n
	on j.title = n.title
	and j.year = n.year
	and j.runtime = n.runtime
inner join imdb_rts i
	on j.title = i.primarytitle
	and j.year = i.startyear
	and j.runtime = i.runtimeminutes
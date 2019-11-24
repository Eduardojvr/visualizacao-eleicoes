use candidatura;

select p.codPartido,p.sigla, count(c.idCandidato) from candidato c
	inner join PARTIDO p
		on c.codPartido=p.codPartido
	group by c.codPartido;

select descRaca, count(c.idCandidato) from candidato c
	inner join raca r
		on r.codRaca=c.codRaca
    group by r.descRaca;


select p.codPartido,p.sigla, count(c.idCandidato) from candidato c
	inner join PARTIDO p
		on c.codPartido=p.codPartido
	group by c.codPartido;

select max(r.total) from    
(select c.siglaUf , count(c.siglaUf) as total, p.nomePartido 
	from candidato c
		inner join partido p
			on p.codPartido=c.codPartido
		group by c.siglaUf, c.codPartido
) as r;

-- Candidaturas por região
select c.siglaUf , count(c.siglaUf) as total 
	from candidato c
		inner join partido p
			on p.codPartido=c.codPartido
		group by c.siglaUf
        order by total;
        
        
-- Quantidade de candidatos por partido
select p.nomePartido , count(c.codPartido) as total 
	from candidato c
		inner join partido p
			on p.codPartido=c.codPartido
		group by c.codPartido;
        
select p.nomePartido, p.sigla, count(c.codPartido) as 'Total de eleitos' from candidato c
	inner join partido p
		on p.codPartido=c.codPartido
where c.resultado like 'ELEITO %'
group by c.codPartido;

select p.nomePartido, p.sigla, count(c.codPartido) as 'Total de candidaturas' from candidato c
	inner join partido p
		on p.codPartido=c.codPartido
	group by c.codPartido;




-- candidaturas por partido X candidatos eleitos
select r.nomePartido, r.sigla, r.totalCandidaturas, c.totalEleitos from
	(
		select  p.nomePartido, p.sigla, count(c.codPartido) as totalCandidaturas from candidato c
		inner join partido p
			on p.codPartido=c.codPartido
		group by c.codPartido
	) as r
inner join 
	(
    select p.nomePartido, p.sigla, count(c.codPartido) as totalEleitos from candidato c
		inner join partido p
			on p.codPartido=c.codPartido
	where c.resultado like 'ELEITO %'
	group by c.codPartido
    ) c
		on c.sigla=r.sigla
	order by totalEleitos desc ;


-- partidos com maior quantidade de eleitos por região

select * from 
	(
		select c.siglaUf , p.sigla , count(c.siglaUf) as total
			from candidato c
				inner join partido p
					on p.codPartido=c.codPartido
				group by c.siglaUf, c.codPartido
	) as m;
    
select c.siglaUf, count(c.siglaUf) as total from candidato c
group by c.siglaUf;
    

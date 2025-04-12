use evento; 

-- mostra os simposios
select * from evento.simposio s;

-- minicursos
select * from evento.minicurso;


-- minicurso por simposio
select
	s.nome,
	m.NOME
from 
	evento.simposio s 
inner join 
	evento.minicurso_simposio ms 
		on s.id = ms.ID_SIMPOSIO 
inner join 
	evento.minicurso m 
		on ms.ID_MINICURSO = m.id;

-- organizadores por simposio

select 
	s.NOME,
	s.LOCALIZACAO,
	p.NOME,
	ps.FUNCAO
from 
	evento.simposio s 
inner join 
	evento.pessoa_simposio ps 
		on s.id = ps.ID_SIMPOSIO 
inner join 
	evento.pessoa p 
		on ps.ID_PESSOA = p.id;


-- comissões
select * from evento.comissao_cientifica cc;


-- pessoas da comissão científica
select 
	cc.NOME_COMISSAO,
	p.NOME
from 
	evento.comissao_cientifica cc 
inner join 
	evento.pessoa_comissao_cientifica pcc 
		on cc.ID = pcc.id_comissao
inner join
	evento.pessoa p
		on pcc.ID_PESSOA = p.ID;
	
	

-- artigos
select * from evento.artigo a;

-- avaliações dos artigos

select
	a.NOME as NOME_ARTIGO,
	a.DATA_PUBLICACAO,
	a.RESUMO,
	t.NOME,
	cc.NOME_COMISSAO,
	aac.NOTA,
	aac.DATA_AVALIACAO
from 
	evento.artigo a 
inner join
	evento.tema t 
		on a.ID_TEMA = t.ID
inner join
	evento.avaliacao_artigo_comissao aac
		on a.ID = aac.ID_ARTIGO
inner join
	evento.comissao_cientifica cc 
		on aac.ID_COMISSAO = cc.ID;


-- pessoa inscrita por minicurso e de qual simposio é
select
	s.NOME nome_simposio,
	s.LOCALIZACAO localizacao_simposio,
	m.NOME nome_minicurso,
	m.CARGA_HORARIA carga_horaria_minicurso,
	t.NOME nome_tema,
	prof.NOME nome_professor,
	p.NOME nome_inscrito,
	p.EMAIL email_inscrito
from 
	evento.simposio s 
inner join 
	evento.minicurso_simposio ms 
		on s.id = ms.ID_SIMPOSIO 
inner join 
	evento.minicurso m 
		on ms.ID_MINICURSO = m.id
inner join
	evento.tema t 
		on m.ID_TEMA = t.id
inner join
	evento.pessoa_minicurso pm 
		on (pm.ID_MINICURSO = m.ID and pm.ID_SIMPOSIO = s.ID)
inner join
	evento.pessoa p
		on pm.ID_PESSOA = p.id
inner join
	evento.pessoa prof
		on (pm.ID_PESSOA = p.id and pm.E_PROFESSOR = true)
order by nome_simposio asc, nome_minicurso ASC;
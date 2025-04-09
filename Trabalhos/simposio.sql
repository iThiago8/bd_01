-- Com base no enunciado a seguir, elabore: o diagrama de entidade e relacionamento, o script
-- de criação de banco de dados e um script de semeadura de dados.
-- Um simpósio será organizado na universidade. A organização é responsabilidade de uma ou 
-- mais pessoas. Serão apresentados nesse simpósio vários mini cursos, e cada um deles será
-- ministrado por apenas uma pessoa. Também serão aceitos artigos, sendo que cada um deles 
-- possuirá um tema (banco de dados, redes, compiladores, realidade virtual etc). 
-- Estes artigos são escritos por no mínimo uma pessoa e não possuem limite de número de 
-- autores. Cada artigo será encaminhado para uma comissão científica, sendo que há 
-- uma comissão científica para cada tema, que por sua vez é formada por uma ou mais pessoas,
-- que emitirão um parecer sobre o artigo. As pessoas se inscreverão no simpósio, podendo 
-- escolher se querem assistir aos mini cursos (e quais) e/ou palestras (e quais).

CREATE DATABASE simposio;
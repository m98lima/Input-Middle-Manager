## Motivação

Videogames sempre foram uma área da programação notória por sua complexidade, envolvendo uma ampla variedade de competências para construir até mesmo um projeto simples, e com o rápido desenvolvimento de tecnologias, a complexidade que desenvolvedores de jogos desejam atingir tem aumentado cada vez mais. Além disso, muitos desenvolvedores de jogos não possuem experiência com engenharia de software, pois vêm de outras áreas como design gráfico, música ou até mesmo algo sem nenhuma correlação com jogos.

Devido a esses fatores, é muito comum que novos desenvolvedores escrevam código de difícil manutenção devido à sua pouca familiaridade com princípios de engenharia de software, o que tende a causar bastante frustração e pode até mesmo desencorajá-los, resultando em um projeto que nunca será finalizado.

## O Input Middle-Manager

Com o objetivo de simplificar o desenvolvimento de jogos cujo design permita várias formas diferentes de controle de personagem, foi construído o Input Middle-Manager para abstrair a gerência entre os métodos de tratamento de input e oferecer uma maneira simples de realizar a troca entre eles.

Para atingir tal objetivo, foi utilizada uma arquitetura de código baseada em [Strategy Pattern](https://refactoring.guru/design-patterns/strategy), onde o input do jogador é passado adiante para ser processado por algum dos scripts de controle de personagem criados pelo desenvolvedor, dependendo das regras do jogo.

O Input Middle-Manager não gera nenhum código nem decide por conta própria quando ocorrerá a troca do script ativo ou qual script será escolhido. O Input Middle-Manager é uma ferramenta que meramente delega o tratamento do input para outros scripts e realiza a troca de qual script ficará responsável pelo tratamento do input mediante chamadas de funções oriundas de scripts externos, escritos pelo desenvolvedor.

Caso queira ler o código do Input Middle-Manager, vá para a pasta "IM-M scripts" acima ou clique [aqui](https://github.com/m98lima/Input-Middle-Manager/tree/main/IM-M%20scripts)

## Pesquisa de validação

Durante este trabalho, foi realizada uma pesquisa de validação sobre o IM-M com um pequeno grupo de 5 pessoas, os resultados podem ser visualizados em um documento PDF acessando a pasta "[Resultados] Pesquisa de validação" ou clicando [aqui](https://github.com/m98lima/Input-Middle-Manager/blob/main/%5BResultados%5D%20Pesquisa%20de%20valida%C3%A7%C3%A3o/%5BResultado%5D%20Valida%C3%A7%C3%A3o%20-%20Input%20Middle-Manager.pdf). Os mesmos resultados também estão disponíveis em uma [planilha de visualização pública](https://docs.google.com/spreadsheets/d/1T3xBBGQ0b5uv7iCg0I3bySmtvp0UeDm_tZXIhZsQhE8/).

## Demo jogável

https://m98lima.itch.io/input-middle-manager-demo


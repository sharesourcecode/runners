# Runners
Scripts macros para multi accs no furia, disponível apenas para o servidor Pt/Br.
**Necessário level 10+ para gastar ouro na arena.**

* Para conta principal use o twm(https://github.com/sharesourcecode/twm/blob/master/README.md)
>1 - Abra o app Termux(https://f-droid.org/repo/com.termux_118.apk) no Android e digite ou cole:
```bash
apt install curl -y
```
>2 - Copie e cole este comando para baixar o instalador do Runners(O link faz parte do comando):
```bash
curl https://github.com/sharesourcecode/runners/raw/master/installrunners.sh -O -L
```
>3 - Copie e cole este comando para instalar o Runners:
```bash
bash installrunners.sh
```
>4 - Para executar o Runners:
```bash
bash runners/play.sh
```
Ao executar irá se abrir o editor de texto nano, adicione `login;senha` como descrito abaixo, separado por `;`

Para adicionar mais contas salte uma linha para cada, ficará parecido com isto:
```bash
Joao;SenhaDeJoao
Maria;SenhaDeMaria
Luiz Inacio;SenhaDeLuizInacio
```
Para salvar modificações feitas com o editor nano use as combinações de teclas `Ctrl o`

Em seguida `Ctrl m`

E finalmente `Ctrl x` para sair do editor. 

Para evitar erros e demora na execução não use mais que 30 accs.
Após iniciar a rede tor(aproximadamente 1m) as accs farão login e executarão as tarefas de 20 em 20 minutos.

Não use outros programas de VPN ou a rede tor não iniciará.

Pode-se executar também em modo 12x arena para abrir baús de clã, neste modo só faz login, troca prata por ouro, arena e sai após a última conta adicionada:
```bash
bash runners/fplay.sh
```

* Para interroper `CTRL c` ou force a parada do app Termux

* Desinstalar scripts:

`rm -rf $HOME/runners`
* Remover dados:

`rm -rf $HOME/.tmp/runners`
* Remover atalho do Termux boot:

`rm -rf $HOME/.termux/boot/runners.sh`

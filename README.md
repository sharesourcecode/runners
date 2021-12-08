# Runners
Scripts macros para multi accs no furia.

>1 - Abra o app Termux(https://f-droid.org/repo/com.termux_117.apk) no Android e digite ou cole:

```apt install curl -y```

>2 - Copie e cole este comando para baixar o instalador do twm(O link faz parte do comando):

```curl https://github.com/sharesourcecode/runners/raw/master/installrunners.sh -O -L```

>3 - Copie e cole este comando para instalar o twm:

```bash installrunners.sh```

>4 - Para executar o twm:

```bash runners/play.sh```

Irá se abrir o editor de texto nano, adicione login;senha desta forma separado por ;
Para adicionar mais contas salte um linha para cada, ficará parecido com isto:
```Joao;SenhaDeJoao
Maria;SenhaDeMaria
Luiz Inacio;SenhaDeLuizInacio```

Executar em modo 12x arena:

```bash twm/play.sh```

`Para interroper (CTRL c) ou force a parada do app Termux`

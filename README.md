# Projeto NMS
Este repositório tem o objetivo de automatizar o Deploy do ambiente de desenvolvimento Laravel, ele utiliza as seguintes tecologias:
- Oracle Virtual Box: para criação da máquina virtual
- Vagrant: para provisionar a máquina virtual

Dentro da pasta vagrant-config estão os arquivos de configuração do Laravel, que serão copiados para dentro da VM. Dentro da pasta vagrant-provision estão os scripts para provisionamento da VM e, posteriormente, do Docker e Compose.

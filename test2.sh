#!/bin/bash
# =====================================================
# Script : genMV.sh
# Étape 1 - Création d'une VM Debian1 sous VirtualBox
# Auteur : Ton Nom
# Date   : $(date +"%d/%m/%Y")
# =====================================================

# Paramètres de la VM
VM_NAME="Debian1"
RAM=4096
CPUS=2
DISK_SIZE=65536   # en Mo (64 Go)
DISK_PATH="$HOME/VirtualBox VMs/$VM_NAME/${VM_NAME}.vdi"
ISO_PATH="$HOME/Downloads/debian-13.1.0-amd64-netinst.iso" 

echo "=== Création de la machine virtuelle $VM_NAME ==="

# 1. Création de la VM
VBoxManage createvm --name "$VM_NAME" --ostype "Debian_64" --register

# 2. Configuration mémoire et CPU
VBoxManage modifyvm "$VM_NAME" --memory $RAM --cpus $CPUS

# 3. Configuration réseau + boot PXE
VBoxManage modifyvm "$VM_NAME" --nic1 nat --boot1 dvd --boot2 disk --boot3 net --boot4 none

# 4. Création du disque dur
VBoxManage createmedium disk --filename "$DISK_PATH" --size $DISK_SIZE --format VDI

# 5. Ajout d’un contrôleur SATA et attachement du disque
VBoxManage storagectl "$VM_NAME" --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach "$VM_NAME" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "$DISK_PATH"

# 6. Ajout d’un contrôleur IDE pour le lecteur CD/DVD
VBoxManage storagectl "$VM_NAME" --name "IDE Controller" --add ide

# 7. Attachement de l’ISO Debian au lecteur DVD
VBoxManage storageattach "$VM_NAME" \
  --storagectl "IDE Controller" --port 0 --device 0 \
  --type dvddrive --medium "$ISO_PATH"

echo "=== VM $VM_NAME créée avec succès avec ISO Debian ==="
echo "Mémoire: ${RAM}Mo | Disque: ${DISK_SIZE}Mo | Réseau: NAT"

# Pause pour vérification
read -p "Vérifie dans VirtualBox que la VM existe avec l’ISO insérée puis appuie sur Entrée pour continuer..."

# 8. Suppression de la VM
VBoxManage unregistervm "$VM_NAME" --delete
echo "=== VM $VM_NAME supprimée ==="


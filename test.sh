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
DISK_PATH="$HOME/VirtualBox/VMs/$VM_NAME/${VM_NAME}.vdi"

echo "=== Création de la machine virtuelle $VM_NAME ==="

# 1. Création de la VM
VBoxManage createvm --name "$VM_NAME" --ostype "Debian_64" --register

# 2. Configuration mémoire et CPU
VBoxManage modifyvm "$VM_NAME" --memory $RAM --cpus $CPUS

# 3. Configuration réseau + boot PXE
VBoxManage modifyvm "$VM_NAME" --nic1 nat --boot1 net --boot2 disk --boot3 none --boot4 none

# 4. Création du disque dur
VBoxManage createmedium disk --filename "$DISK_PATH" --size $DISK_SIZE --format VDI

# 5. Ajout d’un contrôleur SATA et attachement du disque
VBoxManage storagectl "$VM_NAME" --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach "$VM_NAME" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "$DISK_PATH"

echo "=== VM $VM_NAME créée avec succès ! ==="
echo "Mémoire: ${RAM}Mo | Disque: ${DISK_SIZE}Mo | Réseau: NAT + PXE"

# Pause pour vérification
read -p "Vérifie dans VirtualBox que la VM existe puis appuie sur Entrée pour continuer..."

# 6. Suppression de la VM
VBoxManage unregistervm "$VM_NAME" --delete
echo "=== VM $VM_NAME supprimée ==="


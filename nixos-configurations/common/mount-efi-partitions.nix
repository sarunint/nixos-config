{ ... }:

{
  services.udev.extraRules = ''
  # special DOS partition types (EFI, hidden, etc.) and RAID/LVM
  # see http://www.win.tue.nl/~aeb/partitions/partition_types-1.html
  ENV{ID_PART_ENTRY_SCHEME}=="dos", \
    ENV{ID_PART_ENTRY_TYPE}=="0x0|0x11|0x12|0x14|0x16|0x17|0x1b|0x1c|0x1e|0x27|0x3d|0x84|0x8d|0x8e|0x90|0x91|0x92|0x93|0x97|0x98|0x9a|0x9b|0xab|0xbb|0xc2|0xc3|0xdd|0xef|0xfd", \
    ENV{UDISKS_IGNORE}="0"

  # special GUID-identified partition types (EFI System Partition, BIOS Boot partition, RAID/LVM)
  # see http://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs
  ENV{ID_PART_ENTRY_SCHEME}=="gpt", \
    ENV{ID_PART_ENTRY_TYPE}=="c12a7328-f81f-11d2-ba4b-00a0c93ec93b|21686148-6449-6e6f-744e-656564454649|a19d880f-05fc-4d3b-a006-743f0f84911e|e6d6d379-f507-44c2-a23c-238f2a3df928|e3c9e316-0b5c-4db8-817d-f92df00215ae|de94bba4-06d1-4d40-a16a-bfd50179d6ac", \
    ENV{UDISKS_IGNORE}="0"
  '';
}
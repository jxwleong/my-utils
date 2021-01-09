import os
import re
import serial
import serial.tools.list_ports

# Host have putty path in envioment variable,
# thus can directory invoke by calling "putty.exe"
# in CMD
PUTTY_EXE_PATH = "putty.exe"


def get_usb_serial_com():
    """
    @Desc: Get com list for usb serial port devices  
    @Param: None  
    @Retval: List with COM# for all usb serial port   \
             devices
    """
    com_list = []
    ports = serial.tools.list_ports.comports()

    # Find devices with description
    # "USB Serial Port (COM#)"
    for port, desc, hwid in sorted(ports):
        if desc == "USB Serial Port"    \
                   + " ("   \
                   + port   \
                   + ")":
            com_list.append(port)

    return com_list


def get_com_number_for_putty(com_list):
    """
    @Desc: Get the COM# for configuring PuTTY, normally     \
           when the serial cable is connected, they will    \
           be two com port and the com port with later      \
           number will be the correct one.                  
           Hence, this function will return the largest     \
           COM#
    @Param: com_list; List from calling get_usb_serial_com()  
    @Retval: COM# to be used in command to launch PuTTY
    """
    com_no_list = []

    for index, com in enumerate(com_list):
        com_no_list.append(com_list[index][3:len(com_list[index])])
    if com_no_list:
        return "COM" + str(max(com_no_list))

    # Raise exception if USB Serial Port is not detected    
    raise Exception("No USB Serial Port found. Please check the connection.")


def get_putty_command(com, baud_rate=115200):
    """
    @Desc: Get the CMD command to start the PuTTY terminal  
    @Param: com; COM port for USB Serial Port  
    @Retval: CMD command to launch PuTTY  
    """
    return PUTTY_EXE_PATH   \
        + " -serial "    \
        + str(com)  \
        + " -sercfg "  \
        + str(baud_rate)


def main():
    # Call the functions to start the terminal...
    os.system(get_putty_command(com=get_com_number_for_putty(  
        com_list=get_usb_serial_com())))


if __name__ == '__main__':
    main()
#include "config.h"
#include "if_impl.h"
#include "linkedlist.h"

int main(int argc, char* argv[]) {
    PROG_CONFIG* cfg = get_program_config();
    unsigned char mac[6];
    parse_cmdline_opts(argc, argv);
    
    init_if_impl_list();
    if_impl* if_plug = find_if_impl_by_name("sockraw");
    
    if_plug->set_ifname(if_plug,cfg->ifname);
    if_plug->obtain_mac(if_plug, mac);
    printf("%02x%02x%02x%02x%02x%02x\n", mac[0], mac[1],mac[2],mac[3],mac[4],mac[5]);
    return 0;
}

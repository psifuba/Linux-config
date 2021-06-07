#
# DO NOT EDIT THIS FILE!
#
# LVM configuration profile used by lvmdbusd daemon.
#
# This sets up LVM to produce output in the most suitable format for processing
# by lvmdbusd daemon which utilizes LVM shell to execute LVM commands.
#
# Do not edit this file in any way. This profile is distributed together with
# lvmdbusd and it contains configuration that is important for lvmdbusd to
# cooperate and interface with LVM correctly.
#

global {
	# use bytes for expected and deterministic output
	units=b
	# no need for suffix if we have units set
	suffix=0
}

report {
	compact_output=0
	compact_output_cols=""
	binary_values_as_numeric=0
	# time in number of seconds since the Epoch
	time_format="%s"
	mark_hidden_devices=1
	# lvmdbusd expects JSON output
	output_format=json
	# *_cols_full for lvm fullreport's fields which lvmdbusd relies on to update its state
	vgs_cols_full="vg_name,vg_uuid,vg_fmt,vg_size,vg_free,vg_sysid,vg_extent_size,vg_extent_count,vg_free_count,vg_profile,max_lv,max_pv,pv_count,lv_count,snap_count,vg_seqno,vg_mda_count,vg_mda_free,vg_mda_size,vg_mda_used_count,vg_attr,vg_tags"
	pvs_cols_full="pv_name,pv_uuid,pv_fmt,pv_size,pv_free,pv_used,dev_size,pv_mda_size,pv_mda_free,pv_ba_start,pv_ba_size,pe_start,pv_pe_count,pv_pe_alloc_count,pv_attr,pv_tags,vg_name,vg_uuid"
	lvs_cols_full="lv_uuid,lv_name,lv_path,lv_size,vg_name,pool_lv_uuid,pool_lv,origin_uuid,origin,data_percent,lv_attr,lv_tags,vg_uuid,lv_active,data_lv,metadata_lv,lv_parent,lv_role,lv_layout"
	pvsegs_cols_full="pvseg_start,pvseg_size,segtype,pv_uuid,lv_uuid,pv_name"
	segs_cols_full="seg_pe_ranges,segtype,lv_uuid"
	vgs_sort_full="vg_name"
	pvs_sort_full="pv_name"
	lvs_sort_full="vg_name,lv_name"
	pvsegs_sort_full="pv_uuid,pvseg_start"
	segs_sort_full="lv_uuid,seg_start"
}

log {
	# lvmdbusd relies on command log report to inspect LVM command's execution status
	report_command_log=1
	# display only outermost LVM shell-related log that lvmdbusd inspects first after LVM command execution (it calls 'lastlog' for more detailed log afterwards if needed)
	command_log_selection="log_context=shell"
	command_log_cols="log_seq_num,log_type,log_context,log_object_type,log_object_name,log_object_id,log_object_group,log_object_group_id,log_message,log_errno,log_ret_code"
	command_log_sort="log_seq_num"
}

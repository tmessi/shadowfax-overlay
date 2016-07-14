# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit unpacker

DDESCRIPTION="Infrastructure as code"
HOMEPAGE="https://www.terraform.io/"
SRC_URI="
	x86? ( https://releases.hashicorp.com/terraform/${PV}/terraform_${PV}_linux_386.zip )
	amd64? ( https://releases.hashicorp.com/terraform/${PV}/terraform_${PV}_linux_amd64.zip )"
LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/"

DEPEND="app-arch/unzip"
RDEPEND="${RDEPEND}"

src_unpack() {
	unpack ${A}
}

src_install() {
	dobin terraform
	dobin terraform-provider-atlas
	dobin terraform-provider-aws
	dobin terraform-provider-azure
	dobin terraform-provider-azurerm
	dobin terraform-provider-chef
	dobin terraform-provider-clc
	dobin terraform-provider-cloudflare
	dobin terraform-provider-cloudstack
	dobin terraform-provider-cobbler
	dobin terraform-provider-consul
	dobin terraform-provider-datadog
	dobin terraform-provider-digitalocean
	dobin terraform-provider-dme
	dobin terraform-provider-dnsimple
	dobin terraform-provider-docker
	dobin terraform-provider-dyn
	dobin terraform-provider-fastly
	dobin terraform-provider-github
	dobin terraform-provider-google
	dobin terraform-provider-heroku
	dobin terraform-provider-influxdb
	dobin terraform-provider-librato
	dobin terraform-provider-mailgun
	dobin terraform-provider-mysql
	dobin terraform-provider-null
	dobin terraform-provider-openstack
	dobin terraform-provider-packet
	dobin terraform-provider-postgresql
	dobin terraform-provider-powerdns
	dobin terraform-provider-rundeck
	dobin terraform-provider-softlayer
	dobin terraform-provider-statuscake
	dobin terraform-provider-template
	dobin terraform-provider-terraform
	dobin terraform-provider-tls
	dobin terraform-provider-triton
	dobin terraform-provider-ultradns
	dobin terraform-provider-vcd
	dobin terraform-provider-vsphere
	dobin terraform-provisioner-chef
	dobin terraform-provisioner-file
	dobin terraform-provisioner-local-exec
	dobin terraform-provisioner-remote-exec
}

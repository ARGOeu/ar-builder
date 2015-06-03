PACKAGES=ar-release argo-egi-consumer argo-egi-connectors ar-compute argo-web-api poem ar-data-retention
SRC_DIRS=../ar-release ../argo-egi-consumer ../argo-egi-connectors ../ar-compute-engine ../argo-web-api ../poem ../ar-data-retention
SPEC_FILES=../ar-release/ar-release.spec ../argo-egi-consumer/argo-egi-consumer.spec ../argo-egi-connectors/argo-egi-connectors.spec ../ar-compute-engine/ar-compute.spec ../argo-web-api/argo-web-api.spec ../poem/poem.spec ../ar-data-retention/ar-data-retention.spec

sources:
	for i in ${SRC_DIRS}; do cd $$i ; make sources ; done
	for i in ${SRC_DIRS}; do mv $$i/*.tar.gz . ; done

rpms: sources
	for i in ${PACKAGES}; do rpmbuild -ta --define='dist .el6' $$i*gz ; done

clean:
	rm -f *.tar.gz;



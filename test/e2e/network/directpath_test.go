/*
Copyright 2015 The Kubernetes Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

package network

import (
	clientset "k8s.io/client-go/kubernetes"
	"k8s.io/kubernetes/test/e2e/framework"

	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
)

var _ = SIGDescribe("DirectPath [DirectPath:GrpcTestClient]", func() {
	f := framework.NewDefaultFramework("direcpath-test")

	var c clientset.Interface
	BeforeEach(func() {
		c = f.ClientSet
	})

	It("Should create pod that runs grpc test func", func() {
		framework.RunKubectlOrDie("create", "-f", "grpc-client.yaml")
		framework.WaitForPodRuning("grpc-client")
		framework.RunCommandViaContainer("grpc-client", "", "/go/bin/client --server_host=grpc-directpath.staging.googleapis.com --server_port=443 --use_alts=true")
	})
})

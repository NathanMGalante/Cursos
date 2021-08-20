import Leilao from '@/components/Leilao'
import { mount } from '@vue/test-utils'

const leilao = {
	produto: 'Um livro da casa do código',
	lanceInicial: 49,
	descricao: 'Um maravilhoso livro sobre VUE'
}

describe('Leilao.vue - exibir os dados do produto', () => {
	test('exibir dados no card', () => {
		const wrapper = mount(Leilao, {
			propsData: {
				leilao
			}
		})

		const header = wrapper.find('.card-header').element
		const title = wrapper.find('.card-title').element
		const text = wrapper.find('.card-text').element

		expect(wrapper).toBeTruthy()

		expect(header.textContent).toBeTruthy()
		expect(title.textContent).toBeTruthy()
		expect(text.textContent).toBeTruthy()
		
		expect(header.textContent).toContain(`Estamos leiloando um(a): ${leilao.produto}`)
		expect(title.textContent).toContain(`Lance inicial: R$ ${leilao.lanceInicial}`)
		expect(text.textContent).toContain(`${leilao.descricao}`)
	})
})
<?php
class ControllerExtensionModuleBasecart extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/basecart');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('basecart', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_nav'] = $this->language->get('entry_nav');
		$data['entry_navdefault'] = $this->language->get('entry_navdefault');
		$data['entry_navinverse'] = $this->language->get('entry_navinverse');
		$data['entry_theme'] = $this->language->get('entry_theme');
		$data['entry_themedefault'] = $this->language->get('entry_themedefault');
		$data['entry_themecerulean'] = $this->language->get('entry_themecerulean');
		$data['entry_themecosmo'] = $this->language->get('entry_themecosmo');
		$data['entry_themecyborg'] = $this->language->get('entry_themecyborg');
		$data['entry_themedarkly'] = $this->language->get('entry_themedarkly');
		$data['entry_themeflatly'] = $this->language->get('entry_themeflatly');
		$data['entry_themejournal'] = $this->language->get('entry_themejournal');
		$data['entry_themelumen'] = $this->language->get('entry_themelumen');
		$data['entry_themepaper'] = $this->language->get('entry_themepaper');
		$data['entry_themereadable'] = $this->language->get('entry_themereadable');
		$data['entry_themesandstone'] = $this->language->get('entry_themesandstone');
		$data['entry_themesimplex'] = $this->language->get('entry_themesimplex');
		$data['entry_themeslate'] = $this->language->get('entry_themeslate');
		$data['entry_themespacelab'] = $this->language->get('entry_themespacelab');
		$data['entry_themesuperhero'] = $this->language->get('entry_themesuperhero');
		$data['entry_themeunited'] = $this->language->get('entry_themeunited');
		$data['entry_themeyeti'] = $this->language->get('entry_themeyeti');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/basecart', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/basecart', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		$value = array(
			'basecart_module_nav',
			'basecart_module_navdefault',
			'basecart_module_navinverse',
			'basecart_module_theme',
			'basecart_module_default',
			'basecart_module_cerulean',
			'basecart_module_cosmo',
			'basecart_module_cyborg',
			'basecart_module_darkly',
			'basecart_module_flatly',
			'basecart_module_journal',
			'basecart_module_lumen',
			'basecart_module_paper',
			'basecart_module_readable',
			'basecart_module_sandstone',
			'basecart_module_simplex',
			'basecart_module_slate',
			'basecart_module_spacelab',
			'basecart_module_superhero',
			'basecart_module_united',
			'basecart_module_yeti'
		);

		foreach ($value as $option) {
				if (isset($this->request->post[$option])) {
						$data[$option] = $this->request->post[$option];
				} else {
						$data[$option] = $this->config->get($option);
				}
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/basecart', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/basecart')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}
